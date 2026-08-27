#if defined(__GNUC__) && (defined(__m68k__) && !defined(__mcoldfire__))

/* a.out MiNT prefixes C symbols with '_'; MiNT ELF does not.
   __USER_LABEL_PREFIX__ is '_' and empty respectively. */
#define SYM_(a,b)	a##b
#define SYM__(a,b)	SYM_(a,b)
#define SYM(x)		SYM__(__USER_LABEL_PREFIX__, x)

	.globl	SYM(FixedMul020)
	.globl	SYM(FixedDiv2020)

	.chip	68020

SYM(FixedMul020):
	move.l 4(%sp),%d0
	move.l 8(%sp),%d1

	mulsl	%d1,%d1:%d0
	movew	%d1,%d0
	swap	%d0

	rts

SYM(FixedDiv2020):
	move.l %d2,-(%sp)
	move.l 8(%sp),%d0

	movel	%d0,d2
	swap	%d0
	movew	%d0,d1
	extl	d1
	clrw	%d0
	divsl	12(%sp),d1:%d0

	move.l (%sp)+,%d2
	rts

#endif
