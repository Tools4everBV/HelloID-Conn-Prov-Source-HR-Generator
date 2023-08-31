$c = $configuration | ConvertFrom-Json

Write-Verbose -Verbose "Generating persons";

$persons = HrGenerator `
            -Type Person `
            -NrOfPersons $c.nrOfPersons `
            -NrOfContracts $c.nrOfContracts `
            -NrOfDepartments $c.nrOfDepartments `
            -PercentageDepartmentsWithParentDepartments $c.percentageOfDepartmentsWithParentDepartments `
            -PercentageInactivePersons $c.percentageOfInactivePersons `
            -Convention $c.convention `
            -Seed $c.seed;

Write-Verbose -Verbose "Sending persons to HelloID";
foreach ($person in $persons)
{
    Write-Output $person | ConvertTo-Json -Depth 10
}
Write-Verbose -Verbose "Person import completed";