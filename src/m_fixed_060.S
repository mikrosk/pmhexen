#if defined(__GNUC__) && (defined(__m68k__) && !defined(__mcoldfire__))

/* a.out MiNT prefixes C symbols with '_'; MiNT ELF does not.
   __USER_LABEL_PREFIX__ is '_' and empty respectively. */
#define SYM_(a,b)	a##b
#define SYM__(a,b)	SYM_(a,b)
#define SYM(x)		SYM__(__USER_LABEL_PREFIX__, x)

	.globl	SYM(FixedMul060)
	.globl	SYM(FixedDiv2060)

	.chip	68060

SYM(FixedMul060):
	fmove.l	4(%sp),fp0
	fmul.l	8(%sp),fp0
	fmul.s	&0f0.0000152587890625,fp0
	fmove.l	fp0,%d0

	rts

SYM(FixedDiv2060):
	fmove.l	4(%sp),fp0
	fmove.l	8(%sp),fp1
	fdiv.x		fp1,fp0
	fmul.s		&0f65536.0,fp0
	fmove.l	fp0,d0

	rts

#endif
