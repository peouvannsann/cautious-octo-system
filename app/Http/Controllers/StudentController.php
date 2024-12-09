<?php

namespace App\Http\Controllers;

use App\Models\Student;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class StudentController extends Controller
{
    public function fetchStudents()
    {
        // $students = Student::all();
        // $students = Student::where('id',3)->get();
        // $students = Student::whereBetween('id', [33,44])->get();
        // $students = Student::whereBetween('id', [33,44])->orderBy('id', 'DESC')->get();
        // $students = DB::table('students')->pluck('name')->all();
        // $students = DB::table('students')->get();

        // $query = DB::table('students')->select('name'); // adding select clause to an existing query
        // $students = $query->addSelect('email')->get();

        $students = DB::table('students')->skip(10)->take(5)->get(); // Offset & limit

        return $students;
    }

    public function addStudent()
    {
        return view("CRUD.add_student");
    }

    public function storeStudent(Request $request)
    {
        $name = $request->name;
        $image = $request->file("file");
        $imageName = time().".".$image->extension();
        $image->move(public_path('images'), $imageName);

        $student = new Student();
        $student->name = $name;
        $student->profileimage = $imageName;
        $student->save();
        return back()->with('student_added', 'Student record has been inserted');
    }

    public function all_students()
    {
        $students = Student::all();
        return view("CRUD.all_students", compact("students"));
    }

    public function editStudent($id)
    {
        $student = Student::find($id);
        return view("CRUD.edit_student", compact("student"));
    }

    public function updateStudent(Request $request)
    {
        $name = $request->name;
        $image = $request->file("file");
        $imageName = time().".".$image->extension();
        $image->move(public_path('images'), $imageName);

        $student = Student::find($request->id);
        $student->name = $name;
        $student->profileimage = $imageName;
        $student->save();
        return back()->with("student_update", "Student update success");
    }

    public function deleteStudent($id)
    {
        $student = Student::find($id);
        unlink(public_path('images').'/'.$student->profileimage);
        $student->delete();
        return back()->with("student_deleted", "Student deleted successfully!");
    }
}
