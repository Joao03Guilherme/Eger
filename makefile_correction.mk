# ------------------------------------------------------------------------------------
# Detect OS
UNAME_S := $(shell uname -s)

ifeq ($(UNAME_S), Darwin)  # macOS
    XC16_PATH = /Applications/microchip/xc16/v2.10
else  # Assume Windows
    XC16_PATH = C:/Program\ Files/Microchip/xc16/v2.10
endif

# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/EG_DSP.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk  ${XC16_PATH}/lib/libc99-elf.a ${XC16_PATH}/lib/libc99-pic30-elf.a ${XC16_PATH}/lib/libm-elf.a  
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -o ${DISTDIR}/EG_DSP.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED} "${XC16_PATH}/lib/libc99-elf.a" "${XC16_PATH}/lib/libc99-pic30-elf.a" "${XC16_PATH}/lib/libm-elf.a" -mcpu=$(MP_PROCESSOR_OPTION) -D__DEBUG=__DEBUG -omf=elf -DXPRJ_default=$(CND_CONF) $(COMPARISON_BUILD) -mreserve=data@0x1000:0x101B -mreserve=data@0x101C:0x101D -mreserve=data@0x101E:0x101F -mreserve=data@0x1020:0x1021 -mreserve=data@0x1022:0x1023 -mreserve=data@0x1024:0x1027 -mreserve=data@0x1028:0x104F -Wl,--local-stack,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST) -mdfp="${DFP_DIR}/xc16" 

else
${DISTDIR}/EG_DSP.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk  ${XC16_PATH}/lib/libc99-elf.a ${XC16_PATH}/lib/libc99-pic30-elf.a ${XC16_PATH}/lib/libm-elf.a 
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -o ${DISTDIR}/EG_DSP.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED} "${XC16_PATH}/lib/libc99-elf.a" "${XC16_PATH}/lib/libc99-pic30-elf.a" "${XC16_PATH}/lib/libm-elf.a" -mcpu=$(MP_PROCESSOR_OPTION) -omf=elf -DXPRJ_default=$(CND_CONF) $(COMPARISON_BUILD) -Wl,--local-stack,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST) -mdfp="${DFP_DIR}/xc16" 
	${MP_CC_DIR}/xc16-bin2hex ${DISTDIR}/EG_DSP.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a -omf=elf -mdfp="${DFP_DIR}/xc16" 

endif