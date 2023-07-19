$departments = HrGenerator -Type Department -NrOfPersons 1 -NrOfContracts 1 -NrOfDepartments 10 -PercentageDepartmentsWithParentDepartments 50 -PercentageInactivePersons 20 -Convention P -ContractCalculationType Employments -Seed 1;
foreach ($department in $departments)
{
    Write-Output $department | ConvertTo-Json -Depth 10
}
Write-Verbose -Verbose "Department import completed";