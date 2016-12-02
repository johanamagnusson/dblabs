
def depProgInsert(writeFile):
    depInsertString         = "INSERT INTO Departments (name, abbr) VALUES ('{0}', '{1}');\n"
    progInsertString        = "INSERT INTO Programs (name, abbr) VALUES ('{0}', '{1}');\n"
    hostedByInsertString    = "INSERT INTO HostedBy (programName, departmentName) VALUES ('{0}', '{1}');\n"
    branchInsertString      = "INSERT INTO Branches (name, program) VALUES ('{0}', '{1}')\n"

    readFile = open("departmentsAndPrograms.txt")
    lines = [line.rstrip("\n") for line in readFile]
    readFile.close()
    
    for line in lines:
        print(line)

    currentSection = 0
    for line in lines[1:]:
        split = line.split("\t")
        if currentSection == 0:
            if "--" in line:
                currentSection = 1
            else:
                writeFile.write(depInsertString.format(split[0], split[1]))
        elif currentSection == 1:
            if "--" in line:
                currentSection = 2
            else:
                writeFile.write(progInsertString.format(split[0], split[1]))
        elif currentSection == 2:
            if "--" in line:
                currentSection = 3
            else:
                writeFile.write(hostedByInsertString.format(split[0], split[1]))
        elif currentSection == 3:
            writeFile.write(branchInsertString.format(split[0], split[1]))


def main():
    writeFile = open("insert.sql","w")

    depProgInsert(writeFile)

    writeFile.close()

main()

