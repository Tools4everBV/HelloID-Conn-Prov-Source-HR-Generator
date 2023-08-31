$c = $configuration | ConvertFrom-Json

Write-Verbose -Verbose "Generating departments";

$departments = HrGenerator `
            -Type Department `
            -NrOfPersons $c.nrOfPersons `
            -NrOfContracts $c.nrOfContracts `
            -NrOfDepartments $c.nrOfDepartments `
            -PercentageDepartmentsWithParentDepartments $c.percentageOfDepartmentsWithParentDepartments `
            -PercentageInactivePersons $c.percentageOfInactivePersons `
            -Convention $c.convention `
            -Seed $c.seed;

Write-Verbose -Verbose "Sending departments to HelloID";
foreach ($department in $departments)
{
    Write-Output $department | ConvertTo-Json -Depth 10
}
Write-Verbose -Verbose "Department import completed";
Write-Verbose -Verbose "Person import completed";