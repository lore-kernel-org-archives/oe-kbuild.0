Content-Type: multipart/mixed; boundary="===============6349880970698809522=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: lib/vsprintf.c:3615 vsscanf() error: uninitialized symbol 'next'.
Date: Sat, 07 May 2022 19:39:24 +0800
Message-ID: <202205071941.vVWoJU45-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6349880970698809522==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Richard Fitzgerald <rf@opensource.cirrus.com>
CC: Petr Mladek <pmladek@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4b97bac0756a81cda5afd45417a99b5bccdcff67
commit: 900fdc4573766dd43b847b4f54bd4a1ee2bc7360 lib: vsprintf: Fix handlin=
g of number field widths in vsscanf
date:   12 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 12 months ago
config: openrisc-randconfig-m031-20220506 (https://download.01.org/0day-ci/=
archive/20220507/202205071941.vVWoJU45-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D900fdc4573766dd43b847b4f54bd4a1ee2bc7360
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 900fdc4573766dd43b847b4f54bd4a1ee2bc7360
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.3.0 make.cross=
 W=3D1 ARCH=3Dopenrisc =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

All errors (new ones prefixed by >>):

   or1k-linux-ld: arch/openrisc/kernel/entry.o: in function `_external_irq_=
handler':
>> (.text+0x83c): undefined reference to `printk'
   (.text+0x83c): relocation truncated to fit: R_OR1K_INSN_REL_26 against u=
ndefined symbol `printk'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for LOCKDEP
   Depends on DEBUG_KERNEL && LOCK_DEBUGGING_SUPPORT && (FRAME_POINTER || M=
IPS || PPC || S390 || MICROBLAZE || ARM || ARC || X86)
   Selected by
   - PROVE_LOCKING && DEBUG_KERNEL && LOCK_DEBUGGING_SUPPORT
   - DEBUG_LOCK_ALLOC && DEBUG_KERNEL && LOCK_DEBUGGING_SUPPORT

New smatch warnings:
lib/vsprintf.c:3615 vsscanf() error: uninitialized symbol 'next'.

Old smatch warnings:
lib/vsprintf.c:1440 ip6_compressed_string() warn: possible spectre second h=
alf.  '*p'
lib/vsprintf.c:1443 ip6_compressed_string() warn: possible spectre second h=
alf.  '*p'

vim +/next +3615 lib/vsprintf.c

4370aa4aa75391 Lai Jiangshan      2009-03-06  3344  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3345  /**
^1da177e4c3f41 Linus Torvalds     2005-04-16  3346   * vsscanf - Unformat a=
 buffer into a list of arguments
^1da177e4c3f41 Linus Torvalds     2005-04-16  3347   * @buf:	input buffer
^1da177e4c3f41 Linus Torvalds     2005-04-16  3348   * @fmt:	format of buff=
er
^1da177e4c3f41 Linus Torvalds     2005-04-16  3349   * @args:	arguments
^1da177e4c3f41 Linus Torvalds     2005-04-16  3350   */
^1da177e4c3f41 Linus Torvalds     2005-04-16  3351  int vsscanf(const char =
*buf, const char *fmt, va_list args)
^1da177e4c3f41 Linus Torvalds     2005-04-16  3352  {
^1da177e4c3f41 Linus Torvalds     2005-04-16  3353  	const char *str =3D bu=
f;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3354  	char *next;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3355  	char digit;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3356  	int num =3D 0;
ef0658f3de484b Joe Perches        2010-03-06  3357  	u8 qualifier;
53809751ac230a Jan Beulich        2012-12-17  3358  	unsigned int base;
53809751ac230a Jan Beulich        2012-12-17  3359  	union {
53809751ac230a Jan Beulich        2012-12-17  3360  		long long s;
53809751ac230a Jan Beulich        2012-12-17  3361  		unsigned long long u;
53809751ac230a Jan Beulich        2012-12-17  3362  	} val;
ef0658f3de484b Joe Perches        2010-03-06  3363  	s16 field_width;
d4be151b2180fb Andr=C3=A9 Goddard Rosa 2009-12-14  3364  	bool is_sign;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3365  =

da99075c1d3683 Jan Beulich        2012-10-04  3366  	while (*fmt) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  3367  		/* skip any white spa=
ce in format */
^1da177e4c3f41 Linus Torvalds     2005-04-16  3368  		/* white space in for=
mat matchs any amount of
^1da177e4c3f41 Linus Torvalds     2005-04-16  3369  		 * white space, inclu=
ding none, in the input.
^1da177e4c3f41 Linus Torvalds     2005-04-16  3370  		 */
^1da177e4c3f41 Linus Torvalds     2005-04-16  3371  		if (isspace(*fmt)) {
e7d2860b690d4f Andr=C3=A9 Goddard Rosa 2009-12-14  3372  			fmt =3D skip_sp=
aces(++fmt);
e7d2860b690d4f Andr=C3=A9 Goddard Rosa 2009-12-14  3373  			str =3D skip_sp=
aces(str);
^1da177e4c3f41 Linus Torvalds     2005-04-16  3374  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  3375  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3376  		/* anything that is n=
ot a conversion must match exactly */
^1da177e4c3f41 Linus Torvalds     2005-04-16  3377  		if (*fmt !=3D '%' && =
*fmt) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  3378  			if (*fmt++ !=3D *str=
++)
^1da177e4c3f41 Linus Torvalds     2005-04-16  3379  				break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3380  			continue;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3381  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  3382  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3383  		if (!*fmt)
^1da177e4c3f41 Linus Torvalds     2005-04-16  3384  			break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3385  		++fmt;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3386  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3387  		/* skip this conversi=
on.
^1da177e4c3f41 Linus Torvalds     2005-04-16  3388  		 * advance both strin=
gs to next white space
^1da177e4c3f41 Linus Torvalds     2005-04-16  3389  		 */
^1da177e4c3f41 Linus Torvalds     2005-04-16  3390  		if (*fmt =3D=3D '*') {
da99075c1d3683 Jan Beulich        2012-10-04  3391  			if (!*str)
da99075c1d3683 Jan Beulich        2012-10-04  3392  				break;
f9310b2f9a19b7 Jessica Yu         2016-03-17  3393  			while (!isspace(*fmt=
) && *fmt !=3D '%' && *fmt) {
f9310b2f9a19b7 Jessica Yu         2016-03-17  3394  				/* '%*[' not yet su=
pported, invalid format */
f9310b2f9a19b7 Jessica Yu         2016-03-17  3395  				if (*fmt =3D=3D '[')
f9310b2f9a19b7 Jessica Yu         2016-03-17  3396  					return num;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3397  				fmt++;
f9310b2f9a19b7 Jessica Yu         2016-03-17  3398  			}
^1da177e4c3f41 Linus Torvalds     2005-04-16  3399  			while (!isspace(*str=
) && *str)
^1da177e4c3f41 Linus Torvalds     2005-04-16  3400  				str++;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3401  			continue;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3402  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  3403  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3404  		/* get field width */
^1da177e4c3f41 Linus Torvalds     2005-04-16  3405  		field_width =3D -1;
53809751ac230a Jan Beulich        2012-12-17  3406  		if (isdigit(*fmt)) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  3407  			field_width =3D skip=
_atoi(&fmt);
53809751ac230a Jan Beulich        2012-12-17  3408  			if (field_width <=3D=
 0)
53809751ac230a Jan Beulich        2012-12-17  3409  				break;
53809751ac230a Jan Beulich        2012-12-17  3410  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  3411  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3412  		/* get conversion qua=
lifier */
^1da177e4c3f41 Linus Torvalds     2005-04-16  3413  		qualifier =3D -1;
75fb8f269305fc Andy Shevchenko    2011-07-25  3414  		if (*fmt =3D=3D 'h' |=
| _tolower(*fmt) =3D=3D 'l' ||
5b5e0928f742cf Alexey Dobriyan    2017-02-27  3415  		    *fmt =3D=3D 'z') {
^1da177e4c3f41 Linus Torvalds     2005-04-16  3416  			qualifier =3D *fmt++;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3417  			if (unlikely(qualifi=
er =3D=3D *fmt)) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  3418  				if (qualifier =3D=
=3D 'h') {
^1da177e4c3f41 Linus Torvalds     2005-04-16  3419  					qualifier =3D 'H';
^1da177e4c3f41 Linus Torvalds     2005-04-16  3420  					fmt++;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3421  				} else if (qualifie=
r =3D=3D 'l') {
^1da177e4c3f41 Linus Torvalds     2005-04-16  3422  					qualifier =3D 'L';
^1da177e4c3f41 Linus Torvalds     2005-04-16  3423  					fmt++;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3424  				}
^1da177e4c3f41 Linus Torvalds     2005-04-16  3425  			}
^1da177e4c3f41 Linus Torvalds     2005-04-16  3426  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  3427  =

da99075c1d3683 Jan Beulich        2012-10-04  3428  		if (!*fmt)
da99075c1d3683 Jan Beulich        2012-10-04  3429  			break;
da99075c1d3683 Jan Beulich        2012-10-04  3430  =

da99075c1d3683 Jan Beulich        2012-10-04  3431  		if (*fmt =3D=3D 'n') {
da99075c1d3683 Jan Beulich        2012-10-04  3432  			/* return number of =
characters read so far */
da99075c1d3683 Jan Beulich        2012-10-04  3433  			*va_arg(args, int *)=
 =3D str - buf;
da99075c1d3683 Jan Beulich        2012-10-04  3434  			++fmt;
da99075c1d3683 Jan Beulich        2012-10-04  3435  			continue;
da99075c1d3683 Jan Beulich        2012-10-04  3436  		}
da99075c1d3683 Jan Beulich        2012-10-04  3437  =

da99075c1d3683 Jan Beulich        2012-10-04  3438  		if (!*str)
^1da177e4c3f41 Linus Torvalds     2005-04-16  3439  			break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3440  =

d4be151b2180fb Andr=C3=A9 Goddard Rosa 2009-12-14  3441  		base =3D 10;
3f623eba2a7fc0 Fabian Frederick   2014-06-04  3442  		is_sign =3D false;
d4be151b2180fb Andr=C3=A9 Goddard Rosa 2009-12-14  3443  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3444  		switch (*fmt++) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  3445  		case 'c':
^1da177e4c3f41 Linus Torvalds     2005-04-16  3446  		{
^1da177e4c3f41 Linus Torvalds     2005-04-16  3447  			char *s =3D (char *)=
va_arg(args, char*);
^1da177e4c3f41 Linus Torvalds     2005-04-16  3448  			if (field_width =3D=
=3D -1)
^1da177e4c3f41 Linus Torvalds     2005-04-16  3449  				field_width =3D 1;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3450  			do {
^1da177e4c3f41 Linus Torvalds     2005-04-16  3451  				*s++ =3D *str++;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3452  			} while (--field_wid=
th > 0 && *str);
^1da177e4c3f41 Linus Torvalds     2005-04-16  3453  			num++;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3454  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  3455  		continue;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3456  		case 's':
^1da177e4c3f41 Linus Torvalds     2005-04-16  3457  		{
^1da177e4c3f41 Linus Torvalds     2005-04-16  3458  			char *s =3D (char *)=
va_arg(args, char *);
^1da177e4c3f41 Linus Torvalds     2005-04-16  3459  			if (field_width =3D=
=3D -1)
4be929be34f9bd Alexey Dobriyan    2010-05-24  3460  				field_width =3D SHR=
T_MAX;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3461  			/* first, skip leadi=
ng white space in buffer */
e7d2860b690d4f Andr=C3=A9 Goddard Rosa 2009-12-14  3462  			str =3D skip_sp=
aces(str);
^1da177e4c3f41 Linus Torvalds     2005-04-16  3463  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3464  			/* now copy until ne=
xt white space */
7b9186f5eb0b17 Andr=C3=A9 Goddard Rosa 2009-12-14  3465  			while (*str && =
!isspace(*str) && field_width--)
^1da177e4c3f41 Linus Torvalds     2005-04-16  3466  				*s++ =3D *str++;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3467  			*s =3D '\0';
^1da177e4c3f41 Linus Torvalds     2005-04-16  3468  			num++;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3469  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  3470  		continue;
f9310b2f9a19b7 Jessica Yu         2016-03-17  3471  		/*
f9310b2f9a19b7 Jessica Yu         2016-03-17  3472  		 * Warning: This impl=
ementation of the '[' conversion specifier
f9310b2f9a19b7 Jessica Yu         2016-03-17  3473  		 * deviates from its =
glibc counterpart in the following ways:
f9310b2f9a19b7 Jessica Yu         2016-03-17  3474  		 * (1) It does NOT su=
pport ranges i.e. '-' is NOT a special
f9310b2f9a19b7 Jessica Yu         2016-03-17  3475  		 *     character
f9310b2f9a19b7 Jessica Yu         2016-03-17  3476  		 * (2) It cannot matc=
h the closing bracket ']' itself
f9310b2f9a19b7 Jessica Yu         2016-03-17  3477  		 * (3) A field width =
is required
f9310b2f9a19b7 Jessica Yu         2016-03-17  3478  		 * (4) '%*[' (discard=
 matching input) is currently not supported
f9310b2f9a19b7 Jessica Yu         2016-03-17  3479  		 *
f9310b2f9a19b7 Jessica Yu         2016-03-17  3480  		 * Example usage:
f9310b2f9a19b7 Jessica Yu         2016-03-17  3481  		 * ret =3D sscanf("00=
:0a:95","%2[^:]:%2[^:]:%2[^:]",
f9310b2f9a19b7 Jessica Yu         2016-03-17  3482  		 *		buf1, buf2, buf3);
f9310b2f9a19b7 Jessica Yu         2016-03-17  3483  		 * if (ret < 3)
f9310b2f9a19b7 Jessica Yu         2016-03-17  3484  		 *    // etc..
f9310b2f9a19b7 Jessica Yu         2016-03-17  3485  		 */
f9310b2f9a19b7 Jessica Yu         2016-03-17  3486  		case '[':
f9310b2f9a19b7 Jessica Yu         2016-03-17  3487  		{
f9310b2f9a19b7 Jessica Yu         2016-03-17  3488  			char *s =3D (char *)=
va_arg(args, char *);
f9310b2f9a19b7 Jessica Yu         2016-03-17  3489  			DECLARE_BITMAP(set, =
256) =3D {0};
f9310b2f9a19b7 Jessica Yu         2016-03-17  3490  			unsigned int len =3D=
 0;
f9310b2f9a19b7 Jessica Yu         2016-03-17  3491  			bool negate =3D (*fm=
t =3D=3D '^');
f9310b2f9a19b7 Jessica Yu         2016-03-17  3492  =

f9310b2f9a19b7 Jessica Yu         2016-03-17  3493  			/* field width is re=
quired */
f9310b2f9a19b7 Jessica Yu         2016-03-17  3494  			if (field_width =3D=
=3D -1)
f9310b2f9a19b7 Jessica Yu         2016-03-17  3495  				return num;
f9310b2f9a19b7 Jessica Yu         2016-03-17  3496  =

f9310b2f9a19b7 Jessica Yu         2016-03-17  3497  			if (negate)
f9310b2f9a19b7 Jessica Yu         2016-03-17  3498  				++fmt;
f9310b2f9a19b7 Jessica Yu         2016-03-17  3499  =

f9310b2f9a19b7 Jessica Yu         2016-03-17  3500  			for ( ; *fmt && *fmt=
 !=3D ']'; ++fmt, ++len)
f9310b2f9a19b7 Jessica Yu         2016-03-17  3501  				set_bit((u8)*fmt, s=
et);
f9310b2f9a19b7 Jessica Yu         2016-03-17  3502  =

f9310b2f9a19b7 Jessica Yu         2016-03-17  3503  			/* no ']' or no char=
acter set found */
f9310b2f9a19b7 Jessica Yu         2016-03-17  3504  			if (!*fmt || !len)
f9310b2f9a19b7 Jessica Yu         2016-03-17  3505  				return num;
f9310b2f9a19b7 Jessica Yu         2016-03-17  3506  			++fmt;
f9310b2f9a19b7 Jessica Yu         2016-03-17  3507  =

f9310b2f9a19b7 Jessica Yu         2016-03-17  3508  			if (negate) {
f9310b2f9a19b7 Jessica Yu         2016-03-17  3509  				bitmap_complement(s=
et, set, 256);
f9310b2f9a19b7 Jessica Yu         2016-03-17  3510  				/* exclude null '\0=
' byte */
f9310b2f9a19b7 Jessica Yu         2016-03-17  3511  				clear_bit(0, set);
f9310b2f9a19b7 Jessica Yu         2016-03-17  3512  			}
f9310b2f9a19b7 Jessica Yu         2016-03-17  3513  =

f9310b2f9a19b7 Jessica Yu         2016-03-17  3514  			/* match must be non=
-empty */
f9310b2f9a19b7 Jessica Yu         2016-03-17  3515  			if (!test_bit((u8)*s=
tr, set))
f9310b2f9a19b7 Jessica Yu         2016-03-17  3516  				return num;
f9310b2f9a19b7 Jessica Yu         2016-03-17  3517  =

f9310b2f9a19b7 Jessica Yu         2016-03-17  3518  			while (test_bit((u8)=
*str, set) && field_width--)
f9310b2f9a19b7 Jessica Yu         2016-03-17  3519  				*s++ =3D *str++;
f9310b2f9a19b7 Jessica Yu         2016-03-17  3520  			*s =3D '\0';
f9310b2f9a19b7 Jessica Yu         2016-03-17  3521  			++num;
f9310b2f9a19b7 Jessica Yu         2016-03-17  3522  		}
f9310b2f9a19b7 Jessica Yu         2016-03-17  3523  		continue;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3524  		case 'o':
^1da177e4c3f41 Linus Torvalds     2005-04-16  3525  			base =3D 8;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3526  			break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3527  		case 'x':
^1da177e4c3f41 Linus Torvalds     2005-04-16  3528  		case 'X':
^1da177e4c3f41 Linus Torvalds     2005-04-16  3529  			base =3D 16;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3530  			break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3531  		case 'i':
^1da177e4c3f41 Linus Torvalds     2005-04-16  3532  			base =3D 0;
4c1ca831adb101 Nick Desaulniers   2020-11-15  3533  			fallthrough;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3534  		case 'd':
3f623eba2a7fc0 Fabian Frederick   2014-06-04  3535  			is_sign =3D true;
4c1ca831adb101 Nick Desaulniers   2020-11-15  3536  			fallthrough;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3537  		case 'u':
^1da177e4c3f41 Linus Torvalds     2005-04-16  3538  			break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3539  		case '%':
^1da177e4c3f41 Linus Torvalds     2005-04-16  3540  			/* looking for '%' i=
n str */
^1da177e4c3f41 Linus Torvalds     2005-04-16  3541  			if (*str++ !=3D '%')
^1da177e4c3f41 Linus Torvalds     2005-04-16  3542  				return num;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3543  			continue;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3544  		default:
^1da177e4c3f41 Linus Torvalds     2005-04-16  3545  			/* invalid format; s=
top here */
^1da177e4c3f41 Linus Torvalds     2005-04-16  3546  			return num;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3547  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  3548  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3549  		/* have some sort of =
integer conversion.
^1da177e4c3f41 Linus Torvalds     2005-04-16  3550  		 * first, skip white =
space in buffer.
^1da177e4c3f41 Linus Torvalds     2005-04-16  3551  		 */
e7d2860b690d4f Andr=C3=A9 Goddard Rosa 2009-12-14  3552  		str =3D skip_spa=
ces(str);
^1da177e4c3f41 Linus Torvalds     2005-04-16  3553  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3554  		digit =3D *str;
11b3dda5e8b6cd Richard Fitzgerald 2021-05-14  3555  		if (is_sign && digit =
=3D=3D '-') {
11b3dda5e8b6cd Richard Fitzgerald 2021-05-14  3556  			if (field_width =3D=
=3D 1)
11b3dda5e8b6cd Richard Fitzgerald 2021-05-14  3557  				break;
11b3dda5e8b6cd Richard Fitzgerald 2021-05-14  3558  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3559  			digit =3D *(str + 1);
11b3dda5e8b6cd Richard Fitzgerald 2021-05-14  3560  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  3561  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3562  		if (!digit
^1da177e4c3f41 Linus Torvalds     2005-04-16  3563  		    || (base =3D=3D 1=
6 && !isxdigit(digit))
^1da177e4c3f41 Linus Torvalds     2005-04-16  3564  		    || (base =3D=3D 1=
0 && !isdigit(digit))
^1da177e4c3f41 Linus Torvalds     2005-04-16  3565  		    || (base =3D=3D 8=
 && (!isdigit(digit) || digit > '7'))
^1da177e4c3f41 Linus Torvalds     2005-04-16  3566  		    || (base =3D=3D 0=
 && !isdigit(digit)))
^1da177e4c3f41 Linus Torvalds     2005-04-16  3567  			break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3568  =

53809751ac230a Jan Beulich        2012-12-17  3569  		if (is_sign)
900fdc4573766d Richard Fitzgerald 2021-05-14  3570  			val.s =3D simple_str=
ntoll(str,
900fdc4573766d Richard Fitzgerald 2021-05-14  3571  						field_width >=3D =
0 ? field_width : INT_MAX,
900fdc4573766d Richard Fitzgerald 2021-05-14  3572  						&next, base);
53809751ac230a Jan Beulich        2012-12-17  3573  		else
900fdc4573766d Richard Fitzgerald 2021-05-14  3574  			val.u =3D simple_str=
ntoull(str,
900fdc4573766d Richard Fitzgerald 2021-05-14  3575  						 field_width >=3D=
 0 ? field_width : INT_MAX,
900fdc4573766d Richard Fitzgerald 2021-05-14  3576  						 &next, base);
53809751ac230a Jan Beulich        2012-12-17  3577  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3578  		switch (qualifier) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  3579  		case 'H':	/* that's '=
hh' in format */
53809751ac230a Jan Beulich        2012-12-17  3580  			if (is_sign)
53809751ac230a Jan Beulich        2012-12-17  3581  				*va_arg(args, signe=
d char *) =3D val.s;
53809751ac230a Jan Beulich        2012-12-17  3582  			else
53809751ac230a Jan Beulich        2012-12-17  3583  				*va_arg(args, unsig=
ned char *) =3D val.u;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3584  			break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3585  		case 'h':
53809751ac230a Jan Beulich        2012-12-17  3586  			if (is_sign)
53809751ac230a Jan Beulich        2012-12-17  3587  				*va_arg(args, short=
 *) =3D val.s;
53809751ac230a Jan Beulich        2012-12-17  3588  			else
53809751ac230a Jan Beulich        2012-12-17  3589  				*va_arg(args, unsig=
ned short *) =3D val.u;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3590  			break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3591  		case 'l':
53809751ac230a Jan Beulich        2012-12-17  3592  			if (is_sign)
53809751ac230a Jan Beulich        2012-12-17  3593  				*va_arg(args, long =
*) =3D val.s;
53809751ac230a Jan Beulich        2012-12-17  3594  			else
53809751ac230a Jan Beulich        2012-12-17  3595  				*va_arg(args, unsig=
ned long *) =3D val.u;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3596  			break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3597  		case 'L':
53809751ac230a Jan Beulich        2012-12-17  3598  			if (is_sign)
53809751ac230a Jan Beulich        2012-12-17  3599  				*va_arg(args, long =
long *) =3D val.s;
53809751ac230a Jan Beulich        2012-12-17  3600  			else
53809751ac230a Jan Beulich        2012-12-17  3601  				*va_arg(args, unsig=
ned long long *) =3D val.u;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3602  			break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3603  		case 'z':
53809751ac230a Jan Beulich        2012-12-17  3604  			*va_arg(args, size_t=
 *) =3D val.u;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3605  			break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3606  		default:
53809751ac230a Jan Beulich        2012-12-17  3607  			if (is_sign)
53809751ac230a Jan Beulich        2012-12-17  3608  				*va_arg(args, int *=
) =3D val.s;
53809751ac230a Jan Beulich        2012-12-17  3609  			else
53809751ac230a Jan Beulich        2012-12-17  3610  				*va_arg(args, unsig=
ned int *) =3D val.u;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3611  			break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3612  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  3613  		num++;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3614  =

^1da177e4c3f41 Linus Torvalds     2005-04-16 @3615  		if (!next)
^1da177e4c3f41 Linus Torvalds     2005-04-16  3616  			break;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3617  		str =3D next;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3618  	}
c6b40d16d1cfa1 Johannes Berg      2007-05-08  3619  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  3620  	return num;
^1da177e4c3f41 Linus Torvalds     2005-04-16  3621  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  3622  EXPORT_SYMBOL(vsscanf);
^1da177e4c3f41 Linus Torvalds     2005-04-16  3623  =


:::::: The code at line 3615 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6349880970698809522==--

