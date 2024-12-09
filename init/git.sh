git switch dev && git merge fix_feature
git push origin dev
git switch main && git merge dev && git push origin main
git switch prod && git merge main && git push origin prod
