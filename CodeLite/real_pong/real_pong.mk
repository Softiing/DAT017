##
## Auto Generated makefile by CodeLite IDE
## any manual changes will be erased      
##
## Debug
ProjectName            :=real_pong
ConfigurationName      :=Debug
WorkspacePath          :=C:/Users/Hampus/Desktop/DAT017/CodeLite
ProjectPath            :=C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong
IntermediateDirectory  :=./Debug
OutDir                 := $(IntermediateDirectory)
CurrentFileName        :=
CurrentFilePath        :=
CurrentFileFullPath    :=
User                   :=Hampus
Date                   :=13/12/2017
CodeLitePath           :=C:/cseapp/CodeLite
LinkerName             :=$(CodeLiteDir)/tools/gcc-arm/bin/arm-none-eabi-g++.exe
SharedObjectLinkerName :=$(CodeLiteDir)/tools/gcc-arm/arm-none-eabi-g++.exe -shared -fPIC
ObjectSuffix           :=.o
DependSuffix           :=.o.d
PreprocessSuffix       :=.i
DebugSwitch            :=-g 
IncludeSwitch          :=-I
LibrarySwitch          :=-l
OutputSwitch           :=-o 
LibraryPathSwitch      :=-L
PreprocessorSwitch     :=-D
SourceSwitch           :=-c 
OutputFile             :=$(IntermediateDirectory)/$(ProjectName).elf
Preprocessors          :=
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E
ObjectsFileList        :="real_pong.txt"
PCHCompileFlags        :=
MakeDirCommand         :=makedir
RcCmpOptions           := 
RcCompilerName         :=
LinkOptions            :=  -T$(ProjectPath)/md407-ram.x -L$(ARM_V6LIB) -L$(ARM_GCC_V6LIB) -nostartfiles
IncludePath            :=  $(IncludeSwitch). $(IncludeSwitch). 
IncludePCH             := 
RcIncludePath          := 
Libs                   := $(LibrarySwitch)gcc $(LibrarySwitch)c_nano 
ArLibs                 :=  "gcc" "c_nano" 
LibPath                := $(LibraryPathSwitch). 

##
## Common variables
## AR, CXX, CC, AS, CXXFLAGS and CFLAGS can be overriden using an environment variables
##
AR       := $(CodeLiteDir)/tools/gcc-arm/bin/arm-none-eabi-ar.exe rcu
CXX      := $(CodeLiteDir)/tools/gcc-arm/bin/arm-none-eabi-g++.exe
CC       := $(CodeLiteDir)/tools/gcc-arm/bin/arm-none-eabi-gcc.exe
CXXFLAGS :=  -g -O0 -W $(Preprocessors)
CFLAGS   :=  -Wa,-adhln=test.s -g -O0 -w -mthumb -march=armv6-m  -mfloat-abi=soft -std=c99 -mthumb -march=armv6-m $(Preprocessors)
ASFLAGS  := 
AS       := $(CodeLiteDir)/tools/gcc-arm/bin/arm-none-eabi-as.exe


##
## User defined environment variables
##
CodeLiteDir:=C:\cseapp\CodeLite
ARM_V6LIB:=$(CodeLiteDir)/tools/gcc-arm/arm-none-eabi/lib/thumb/v6-m
ARM_GCC_V6LIB:=$(CodeLiteDir)/tools/gcc-arm/lib/gcc/arm-none-eabi/6.3.1/thumb/v6-m
ARM_M4FPLIB:=$(CodeLiteDir)/tools/gcc-arm/arm-none-eabi/lib/thumb/v7e-m/fpv4-sp/hard
ARM_GCC_M4FPLIB:=$(CodeLiteDir)/tools/gcc-arm/lib/gcc/arm-none-eabi/6.3.1/thumb/v7e-m
Objects0=$(IntermediateDirectory)/startup.c$(ObjectSuffix) $(IntermediateDirectory)/ball.c$(ObjectSuffix) $(IntermediateDirectory)/graphic.c$(ObjectSuffix) $(IntermediateDirectory)/object.c$(ObjectSuffix) $(IntermediateDirectory)/timer.c$(ObjectSuffix) $(IntermediateDirectory)/paddle.c$(ObjectSuffix) $(IntermediateDirectory)/keypad.c$(ObjectSuffix) 



Objects=$(Objects0) 

##
## Main Build Targets 
##
.PHONY: all clean PreBuild PrePreBuild PostBuild MakeIntermediateDirs
all: $(OutputFile)

$(OutputFile): $(IntermediateDirectory)/.d $(Objects) 
	@$(MakeDirCommand) $(@D)
	@echo "" > $(IntermediateDirectory)/.d
	@echo $(Objects0)  > $(ObjectsFileList)
	$(LinkerName) $(OutputSwitch)$(OutputFile) @$(ObjectsFileList) $(LibPath) $(Libs) $(LinkOptions)

PostBuild:
	@echo Executing Post Build commands ...
	arm-none-eabi-objcopy -S -O srec  ./Debug/real_pong.elf ./Debug/real_pong.s19
	arm-none-eabi-objdump -D -S ./Debug/real_pong.elf > ./Debug/real_pong.dass
	@echo Done

MakeIntermediateDirs:
	@$(MakeDirCommand) "./Debug"


$(IntermediateDirectory)/.d:
	@$(MakeDirCommand) "./Debug"

PreBuild:


##
## Objects
##
$(IntermediateDirectory)/startup.c$(ObjectSuffix): startup.c $(IntermediateDirectory)/startup.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong/startup.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/startup.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/startup.c$(DependSuffix): startup.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/startup.c$(ObjectSuffix) -MF$(IntermediateDirectory)/startup.c$(DependSuffix) -MM startup.c

$(IntermediateDirectory)/startup.c$(PreprocessSuffix): startup.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/startup.c$(PreprocessSuffix) startup.c

$(IntermediateDirectory)/ball.c$(ObjectSuffix): ball.c $(IntermediateDirectory)/ball.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong/ball.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/ball.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/ball.c$(DependSuffix): ball.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/ball.c$(ObjectSuffix) -MF$(IntermediateDirectory)/ball.c$(DependSuffix) -MM ball.c

$(IntermediateDirectory)/ball.c$(PreprocessSuffix): ball.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/ball.c$(PreprocessSuffix) ball.c

$(IntermediateDirectory)/graphic.c$(ObjectSuffix): graphic.c $(IntermediateDirectory)/graphic.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong/graphic.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/graphic.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/graphic.c$(DependSuffix): graphic.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/graphic.c$(ObjectSuffix) -MF$(IntermediateDirectory)/graphic.c$(DependSuffix) -MM graphic.c

$(IntermediateDirectory)/graphic.c$(PreprocessSuffix): graphic.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/graphic.c$(PreprocessSuffix) graphic.c

$(IntermediateDirectory)/object.c$(ObjectSuffix): object.c $(IntermediateDirectory)/object.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong/object.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/object.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/object.c$(DependSuffix): object.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/object.c$(ObjectSuffix) -MF$(IntermediateDirectory)/object.c$(DependSuffix) -MM object.c

$(IntermediateDirectory)/object.c$(PreprocessSuffix): object.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/object.c$(PreprocessSuffix) object.c

$(IntermediateDirectory)/timer.c$(ObjectSuffix): timer.c $(IntermediateDirectory)/timer.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong/timer.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/timer.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/timer.c$(DependSuffix): timer.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/timer.c$(ObjectSuffix) -MF$(IntermediateDirectory)/timer.c$(DependSuffix) -MM timer.c

$(IntermediateDirectory)/timer.c$(PreprocessSuffix): timer.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/timer.c$(PreprocessSuffix) timer.c

$(IntermediateDirectory)/paddle.c$(ObjectSuffix): paddle.c $(IntermediateDirectory)/paddle.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong/paddle.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/paddle.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/paddle.c$(DependSuffix): paddle.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/paddle.c$(ObjectSuffix) -MF$(IntermediateDirectory)/paddle.c$(DependSuffix) -MM paddle.c

$(IntermediateDirectory)/paddle.c$(PreprocessSuffix): paddle.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/paddle.c$(PreprocessSuffix) paddle.c

$(IntermediateDirectory)/keypad.c$(ObjectSuffix): keypad.c $(IntermediateDirectory)/keypad.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong/keypad.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/keypad.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/keypad.c$(DependSuffix): keypad.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/keypad.c$(ObjectSuffix) -MF$(IntermediateDirectory)/keypad.c$(DependSuffix) -MM keypad.c

$(IntermediateDirectory)/keypad.c$(PreprocessSuffix): keypad.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/keypad.c$(PreprocessSuffix) keypad.c


-include $(IntermediateDirectory)/*$(DependSuffix)
##
## Clean
##
clean:
	$(RM) -r ./Debug/


