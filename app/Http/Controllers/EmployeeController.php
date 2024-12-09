<?php

namespace App\Http\Controllers;

use App\Models\Employee;

use Illuminate\Http\Request;
use App\Exports\EmployeeExport;
use App\Imports\EmployeeImport;
use Maatwebsite\Excel\Facades\Excel;
use Barryvdh\DomPDF\Facade\Pdf;

class EmployeeController extends Controller
{
    public function addEmployee()
    {
        $employee = [
            [
                "name"=>"Alic",
                "email"=>"alice@gmail.com",
                "phone"=>"123456789",
                "salary"=>"100",
                "department"=>"Manager",
            ]
        ];
        Employee::insert($employee);
        return "Records are inserted";
    }

    public function exportIntoExcel()
    {
        return Excel::download(new EmployeeExport, 'invoices.xlsx');
    }
    public function exportIntoCSV()
    {
        return Excel::download(new EmployeeExport, 'invoices.csv');
    }

    public function getAllEmployees()
    {
        $employees = Employee::all();
        return view("CRUD.employee", compact('employees'));
    }

    public function downloadPDF()
    {
        $employees = Employee::all();
        $pdf =  Pdf::loadView("CRUD.employee", compact('employees'));
        return $pdf->download('employee.pdf');
    }

    public function importForm()
    {
        return view("CRUD.import_form");
    }

    public function import(Request $request)
    {
        Excel::import(new EmployeeImport, $request->file);
        return "Record are imported successfully!";
    }
}
