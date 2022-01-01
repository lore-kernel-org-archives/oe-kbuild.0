Content-Type: multipart/mixed; boundary="===============8594189857967670600=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ojeda-linux:sync 887/889] lib/vsprintf.c:3139:14: warning: Array access (from variable 'end') results in a null pointer dereference [clang-analyzer-core.NullDereference]
Date: Sun, 02 Jan 2022 02:40:38 +0800
Message-ID: <202201020214.EllLQrAG-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8594189857967670600==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Miguel Ojeda <ojeda@kernel.org>

tree:   https://github.com/ojeda/linux.git sync
head:   c2ae669696728da696ba76a2b20db84d5306893a
commit: 3e7c98c0eeefd392badeb4ff0773fcf150b6d63b [887/889] `vsprintf`: avoi=
d `#ifdef` in `.c` file
:::::: branch date: 12 days ago
:::::: commit date: 3 weeks ago
config: arm-randconfig-c002-20211231 (https://download.01.org/0day-ci/archi=
ve/20220102/202201020214.EllLQrAG-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 7cd109=
b92c72855937273a6c8ab19016fbe27d33)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/ojeda/linux/commit/3e7c98c0eeefd392badeb4ff077=
3fcf150b6d63b
        git remote add ojeda-linux https://github.com/ojeda/linux.git
        git fetch --no-tags ojeda-linux sync
        git checkout 3e7c98c0eeefd392badeb4ff0773fcf150b6d63b
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   lib/vsprintf.c:2434:10: note: Calling 'ip_addr_string'
                   return ip_addr_string(buf, end, ptr, spec, fmt);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/vsprintf.c:1598:2: note: Taking false branch
           if (check_pointer(&buf, end, ptr, spec))
           ^
   lib/vsprintf.c:1601:2: note: Control jumps to 'case 52:'  at line 1604
           switch (fmt[1]) {
           ^
   lib/vsprintf.c:1605:10: note: Calling 'ip4_addr_string'
                   return ip4_addr_string(buf, end, ptr, spec, fmt);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/vsprintf.c:1490:2: note: Calling 'ip4_string'
           ip4_string(ip4_addr, addr, fmt);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/vsprintf.c:1329:2: note: Control jumps to the 'default' case at line=
 1345
           switch (fmt[2]) {
           ^
   lib/vsprintf.c:1348:3: note:  Execution continues on line 1350
                   break;
                   ^
   lib/vsprintf.c:1350:2: note: Loop condition is true.  Entering loop body
           for (i =3D 0; i < 4; i++) {
           ^
   lib/vsprintf.c:1352:16: note: Calling 'put_dec_trunc8'
                   int digits =3D put_dec_trunc8(temp, addr[index]) - temp;
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/vsprintf.c:220:6: note: Assuming 'r' is < 100
           if (r < 100)
               ^~~~~~~
   lib/vsprintf.c:220:2: note: Taking true branch
           if (r < 100)
           ^
   lib/vsprintf.c:221:3: note: Control jumps to line 250
                   goto out_r;
                   ^
   lib/vsprintf.c:251:9: note: Assuming 'r' is >=3D 10
           buf +=3D r < 10 ? 1 : 2;
                  ^~~~~~
   lib/vsprintf.c:251:9: note: '?' condition is false
   lib/vsprintf.c:1352:16: note: Returning from 'put_dec_trunc8'
                   int digits =3D put_dec_trunc8(temp, addr[index]) - temp;
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/vsprintf.c:1353:7: note: Assuming 'leading_zeros' is false
                   if (leading_zeros) {
                       ^~~~~~~~~~~~~
   lib/vsprintf.c:1353:3: note: Taking false branch
                   if (leading_zeros) {
                   ^
   lib/vsprintf.c:1360:10: note: The value 1 is assigned to 'digits'
                   while (digits--)
                          ^~~~~~~~
   lib/vsprintf.c:1360:3: note: Loop condition is true.  Entering loop body
                   while (digits--)
                   ^
   lib/vsprintf.c:1361:9: note: Assigned value is garbage or undefined
                           *p++ =3D temp[digits];
                                ^ ~~~~~~~~~~~~
   lib/vsprintf.c:1424:4: warning: Value stored to 'needcolon' is never rea=
d [clang-analyzer-deadcode.DeadStores]
                           needcolon =3D false;
                           ^           ~~~~~
   lib/vsprintf.c:1424:4: note: Value stored to 'needcolon' is never read
                           needcolon =3D false;
                           ^           ~~~~~
   lib/vsprintf.c:1792:2: warning: Call to function 'strcpy' is insecure as=
 it does not provide bounding of the memory buffer. Replace unbounded copy =
functions with analogous functions that support length arguments such as 's=
trlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(p, *fourcc & BIT(31) ? " big-endian" : " little-endian");
           ^~~~~~
   lib/vsprintf.c:1792:2: note: Call to function 'strcpy' is insecure as it=
 does not provide bounding of the memory buffer. Replace unbounded copy fun=
ctions with analogous functions that support length arguments such as 'strl=
cpy'. CWE-119
           strcpy(p, *fourcc & BIT(31) ? " big-endian" : " little-endian");
           ^~~~~~
   lib/vsprintf.c:3137:13: warning: Dereference of null pointer [clang-anal=
yzer-core.NullDereference]
                                           *str++ =3D '\0';
                                           ~~~~~~~^~~~~~
   lib/vsprintf.c:3078:2: note: Loop condition is true.  Entering loop body
           while (*fmt) {
           ^
   lib/vsprintf.c:3083:3: note: Control jumps to 'case FORMAT_TYPE_PTR:'  a=
t line 3118
                   switch (spec.type) {
                   ^
   lib/vsprintf.c:3120:4: note: Control jumps to the 'default' case@line=
 3129
                           switch (*fmt) {
                           ^
   lib/vsprintf.c:3130:9: note: Assuming the condition is false
                                   if (!isalnum(*fmt)) {
                                       ^~~~~~~~~~~~~~
   lib/vsprintf.c:3130:5: note: Taking false branch
                                   if (!isalnum(*fmt)) {
                                   ^
   lib/vsprintf.c:3136:9: note: Assuming the condition is true
                                   if (str + 1 < end)
                                       ^~~~~~~~~~~~~
   lib/vsprintf.c:3136:5: note: Taking true branch
                                   if (str + 1 < end)
                                   ^
   lib/vsprintf.c:3137:7: note: Null pointer value stored to 'str'
                                           *str++ =3D '\0';
                                            ^~~~~
   lib/vsprintf.c:3137:13: note: Dereference of null pointer
                                           *str++ =3D '\0';
                                           ~~~~~~~^~~~~~
>> lib/vsprintf.c:3139:14: warning: Array access (from variable 'end') resu=
lts in a null pointer dereference [clang-analyzer-core.NullDereference]
                                           end[-1] =3D '\0'; /* Must be nul=
 terminated */
                                           ~~~     ^
   lib/vsprintf.c:3052:2: note: Value assigned to 'end'
           end =3D (char *)(bin_buf + size);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/vsprintf.c:3078:2: note: Loop condition is true.  Entering loop body
           while (*fmt) {
           ^
   lib/vsprintf.c:3083:3: note: Control jumps to 'case FORMAT_TYPE_PTR:'  a=
t line 3118
                   switch (spec.type) {
                   ^
   lib/vsprintf.c:3120:4: note: Control jumps to the 'default' case at line=
 3129
                           switch (*fmt) {
                           ^
   lib/vsprintf.c:3130:9: note: Assuming the condition is false
                                   if (!isalnum(*fmt)) {
                                       ^~~~~~~~~~~~~~
   lib/vsprintf.c:3130:5: note: Taking false branch
                                   if (!isalnum(*fmt)) {
                                   ^
   lib/vsprintf.c:3136:9: note: Assuming pointer value is null
                                   if (str + 1 < end)
                                       ^~~~~~~~~~~~~
   lib/vsprintf.c:3136:5: note: Taking false branch
                                   if (str + 1 < end)
                                   ^
   lib/vsprintf.c:3139:14: note: Array access (from variable 'end') results=
 in a null pointer dereference
                                           end[-1] =3D '\0'; /* Must be nul=
 terminated */
                                           ~~~     ^
   1 warning generated.
   drivers/hwtracing/coresight/coresight-cti-core.c:447:2: warning: Value s=
tored to 'reg_value' is never read [clang-analyzer-deadcode.DeadStores]
           reg_value =3D config->ctiappset;
           ^           ~~~~~~~~~~~~~~~~~
   drivers/hwtracing/coresight/coresight-cti-core.c:447:2: note: Value stor=
ed to 'reg_value' is never read
           reg_value =3D config->ctiappset;
           ^           ~~~~~~~~~~~~~~~~~
   2 warnings generated.
   drivers/iio/dac/ad5360.c:74:8: warning: Excessive padding in 'struct ad5=
360_state' (40 padding bytes, where 8 is optimal). =

   Optimal fields order: =

   data, =

   spi, =

   chip_info, =

   ctrl, =

   lock, =

   vref_reg, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct ad5360_state {
   ~~~~~~~^~~~~~~~~~~~~~
   drivers/iio/dac/ad5360.c:74:8: note: Excessive padding in 'struct ad5360=
_state' (40 padding bytes, where 8 is optimal). Optimal fields order: data,=
 spi, chip_info, ctrl, lock, vref_reg, consider reordering the fields or ad=
ding explicit padding members
   struct ad5360_state {
   ~~~~~~~^~~~~~~~~~~~~~
   drivers/iio/dac/ad5360.c:493:26: warning: Assigned value is garbage or u=
ndefined [clang-analyzer-core.uninitialized.Assign]
                   st->vref_reg[i].supply =3D ad5360_vref_name[i];
                                          ^ ~~~~~~~~~~~~~~~~~~~
   drivers/iio/dac/ad5360.c:468:6: note: Assuming 'indio_dev' is not equal =
to NULL
           if (indio_dev =3D=3D NULL) {
               ^~~~~~~~~~~~~~~~~
   drivers/iio/dac/ad5360.c:468:2: note: Taking false branch
           if (indio_dev =3D=3D NULL) {
           ^
   drivers/iio/dac/ad5360.c:484:2: note: Loop condition is false.  Exiting =
loop
           mutex_init(&st->lock);
           ^
   include/linux/mutex.h:101:32: note: expanded from macro 'mutex_init'
   #define mutex_init(mutex)                                               \
                                                                           ^
   drivers/iio/dac/ad5360.c:487:6: note: Assuming 'ret' is 0
           if (ret) {
               ^~~
   drivers/iio/dac/ad5360.c:487:2: note: Taking false branch
           if (ret) {
           ^
   drivers/iio/dac/ad5360.c:492:14: note: Assuming 'i' is < field 'num_vref=
s'
           for (i =3D 0; i < st->chip_info->num_vrefs; ++i)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/dac/ad5360.c:492:2: note: Loop condition is true.  Entering =
loop body
           for (i =3D 0; i < st->chip_info->num_vrefs; ++i)
           ^
   drivers/iio/dac/ad5360.c:492:14: note: Assuming 'i' is < field 'num_vref=
s'
           for (i =3D 0; i < st->chip_info->num_vrefs; ++i)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/dac/ad5360.c:492:2: note: Loop condition is true.  Entering =
loop body
           for (i =3D 0; i < st->chip_info->num_vrefs; ++i)
           ^
   drivers/iio/dac/ad5360.c:492:14: note: Assuming 'i' is < field 'num_vref=
s'
           for (i =3D 0; i < st->chip_info->num_vrefs; ++i)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/dac/ad5360.c:492:2: note: Loop condition is true.  Entering =
loop body
           for (i =3D 0; i < st->chip_info->num_vrefs; ++i)
           ^
   drivers/iio/dac/ad5360.c:492:44: note: The value 3 is assigned to 'i'
           for (i =3D 0; i < st->chip_info->num_vrefs; ++i)
                                                     ^~~
   drivers/iio/dac/ad5360.c:492:14: note: Assuming 'i' is < field 'num_vref=
s'
           for (i =3D 0; i < st->chip_info->num_vrefs; ++i)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/dac/ad5360.c:492:2: note: Loop condition is true.  Entering =
loop body
           for (i =3D 0; i < st->chip_info->num_vrefs; ++i)
           ^
   drivers/iio/dac/ad5360.c:493:26: note: Assigned value is garbage or unde=
fined

vim +/end +3139 lib/vsprintf.c

4370aa4aa75391 Lai Jiangshan           2009-03-06  3077  =

fef20d9c1380f0 Frederic Weisbecker     2009-03-06  3078  	while (*fmt) {
d4be151b2180fb Andr=C3=A9 Goddard Rosa      2009-12-14  3079  		int read =
=3D format_decode(fmt, &spec);
4370aa4aa75391 Lai Jiangshan           2009-03-06  3080  =

fef20d9c1380f0 Frederic Weisbecker     2009-03-06  3081  		fmt +=3D read;
4370aa4aa75391 Lai Jiangshan           2009-03-06  3082  =

fef20d9c1380f0 Frederic Weisbecker     2009-03-06  3083  		switch (spec.typ=
e) {
fef20d9c1380f0 Frederic Weisbecker     2009-03-06  3084  		case FORMAT_TYPE=
_NONE:
d4be151b2180fb Andr=C3=A9 Goddard Rosa      2009-12-14  3085  		case FORMAT=
_TYPE_PERCENT_CHAR:
fef20d9c1380f0 Frederic Weisbecker     2009-03-06  3086  			break;
b006f19b055f90 Rasmus Villemoes        2015-11-06  3087  		case FORMAT_TYPE=
_INVALID:
b006f19b055f90 Rasmus Villemoes        2015-11-06  3088  			goto out;
4370aa4aa75391 Lai Jiangshan           2009-03-06  3089  =

ed681a91ab8053 Vegard Nossum           2009-03-14  3090  		case FORMAT_TYPE=
_WIDTH:
fef20d9c1380f0 Frederic Weisbecker     2009-03-06  3091  		case FORMAT_TYPE=
_PRECISION:
841a915d20c7b2 Steven Rostedt (VMware  2017-12-28  3092) 			width =3D (int)=
save_arg(int);
841a915d20c7b2 Steven Rostedt (VMware  2017-12-28  3093) 			/* Pointers may=
 require the width */
841a915d20c7b2 Steven Rostedt (VMware  2017-12-28  3094) 			if (*fmt =3D=3D=
 'p')
841a915d20c7b2 Steven Rostedt (VMware  2017-12-28  3095) 				set_field_widt=
h(&spec, width);
fef20d9c1380f0 Frederic Weisbecker     2009-03-06  3096  			break;
4370aa4aa75391 Lai Jiangshan           2009-03-06  3097  =

fef20d9c1380f0 Frederic Weisbecker     2009-03-06  3098  		case FORMAT_TYPE=
_CHAR:
4370aa4aa75391 Lai Jiangshan           2009-03-06  3099  			save_arg(char);
fef20d9c1380f0 Frederic Weisbecker     2009-03-06  3100  			break;
fef20d9c1380f0 Frederic Weisbecker     2009-03-06  3101  =

fef20d9c1380f0 Frederic Weisbecker     2009-03-06  3102  		case FORMAT_TYPE=
_STR: {
4370aa4aa75391 Lai Jiangshan           2009-03-06  3103  			const char *sav=
e_str =3D va_arg(args, char *);
3e5903eb9cff70 Petr Mladek             2019-04-17  3104  			const char *err=
_msg;
4370aa4aa75391 Lai Jiangshan           2009-03-06  3105  			size_t len;
6c356634111c5a Andr=C3=A9 Goddard Rosa      2009-12-14  3106  =

3e5903eb9cff70 Petr Mladek             2019-04-17  3107  			err_msg =3D che=
ck_pointer_msg(save_str);
3e5903eb9cff70 Petr Mladek             2019-04-17  3108  			if (err_msg)
3e5903eb9cff70 Petr Mladek             2019-04-17  3109  				save_str =3D e=
rr_msg;
3e5903eb9cff70 Petr Mladek             2019-04-17  3110  =

6c356634111c5a Andr=C3=A9 Goddard Rosa      2009-12-14  3111  			len =3D st=
rlen(save_str) + 1;
6c356634111c5a Andr=C3=A9 Goddard Rosa      2009-12-14  3112  			if (str + =
len < end)
6c356634111c5a Andr=C3=A9 Goddard Rosa      2009-12-14  3113  				memcpy(st=
r, save_str, len);
6c356634111c5a Andr=C3=A9 Goddard Rosa      2009-12-14  3114  			str +=3D l=
en;
fef20d9c1380f0 Frederic Weisbecker     2009-03-06  3115  			break;
4370aa4aa75391 Lai Jiangshan           2009-03-06  3116  		}
fef20d9c1380f0 Frederic Weisbecker     2009-03-06  3117  =

fef20d9c1380f0 Frederic Weisbecker     2009-03-06  3118  		case FORMAT_TYPE=
_PTR:
841a915d20c7b2 Steven Rostedt (VMware  2017-12-28  3119) 			/* Dereferenced=
 pointers must be done now */
841a915d20c7b2 Steven Rostedt (VMware  2017-12-28  3120) 			switch (*fmt) {
841a915d20c7b2 Steven Rostedt (VMware  2017-12-28  3121) 			/* Dereference =
of functions is still OK */
841a915d20c7b2 Steven Rostedt (VMware  2017-12-28  3122) 			case 'S':
841a915d20c7b2 Steven Rostedt (VMware  2017-12-28  3123) 			case 's':
1e6338cfb50e24 Steven Rostedt (VMware  2018-04-03  3124) 			case 'x':
1e6338cfb50e24 Steven Rostedt (VMware  2018-04-03  3125) 			case 'K':
57f5677e535ba2 Rasmus Villemoes        2019-10-15  3126  			case 'e':
4370aa4aa75391 Lai Jiangshan           2009-03-06  3127  				save_arg(void =
*);
841a915d20c7b2 Steven Rostedt (VMware  2017-12-28  3128) 				break;
841a915d20c7b2 Steven Rostedt (VMware  2017-12-28  3129) 			default:
841a915d20c7b2 Steven Rostedt (VMware  2017-12-28  3130) 				if (!isalnum(*=
fmt)) {
841a915d20c7b2 Steven Rostedt (VMware  2017-12-28  3131) 					save_arg(void=
 *);
841a915d20c7b2 Steven Rostedt (VMware  2017-12-28  3132) 					break;
841a915d20c7b2 Steven Rostedt (VMware  2017-12-28  3133) 				}
841a915d20c7b2 Steven Rostedt (VMware  2017-12-28  3134) 				str =3D pointe=
r(fmt, str, end, va_arg(args, void *),
841a915d20c7b2 Steven Rostedt (VMware  2017-12-28  3135) 					      spec);
841a915d20c7b2 Steven Rostedt (VMware  2017-12-28  3136) 				if (str + 1 < =
end)
841a915d20c7b2 Steven Rostedt (VMware  2017-12-28  3137) 					*str++ =3D '\=
0';
841a915d20c7b2 Steven Rostedt (VMware  2017-12-28  3138) 				else
841a915d20c7b2 Steven Rostedt (VMware  2017-12-28 @3139) 					end[-1] =3D '=
\0'; /* Must be nul terminated */
841a915d20c7b2 Steven Rostedt (VMware  2017-12-28  3140) 			}
4370aa4aa75391 Lai Jiangshan           2009-03-06  3141  			/* skip all alp=
hanumeric pointer suffixes */
fef20d9c1380f0 Frederic Weisbecker     2009-03-06  3142  			while (isalnum(=
*fmt))
4370aa4aa75391 Lai Jiangshan           2009-03-06  3143  				fmt++;
fef20d9c1380f0 Frederic Weisbecker     2009-03-06  3144  			break;
fef20d9c1380f0 Frederic Weisbecker     2009-03-06  3145  =

fef20d9c1380f0 Frederic Weisbecker     2009-03-06  3146  		default:
fef20d9c1380f0 Frederic Weisbecker     2009-03-06  3147  			switch (spec.ty=
pe) {
fef20d9c1380f0 Frederic Weisbecker     2009-03-06  3148  =

fef20d9c1380f0 Frederic Weisbecker     2009-03-06  3149  			case FORMAT_TYP=
E_LONG_LONG:
4370aa4aa75391 Lai Jiangshan           2009-03-06  3150  				save_arg(long =
long);
fef20d9c1380f0 Frederic Weisbecker     2009-03-06  3151  				break;
fef20d9c1380f0 Frederic Weisbecker     2009-03-06  3152  			case FORMAT_TYP=
E_ULONG:
fef20d9c1380f0 Frederic Weisbecker     2009-03-06  3153  			case FORMAT_TYP=
E_LONG:
4370aa4aa75391 Lai Jiangshan           2009-03-06  3154  				save_arg(unsig=
ned long);
fef20d9c1380f0 Frederic Weisbecker     2009-03-06  3155  				break;
fef20d9c1380f0 Frederic Weisbecker     2009-03-06  3156  			case FORMAT_TYP=
E_SIZE_T:
4370aa4aa75391 Lai Jiangshan           2009-03-06  3157  				save_arg(size_=
t);
fef20d9c1380f0 Frederic Weisbecker     2009-03-06  3158  				break;
fef20d9c1380f0 Frederic Weisbecker     2009-03-06  3159  			case FORMAT_TYP=
E_PTRDIFF:
4370aa4aa75391 Lai Jiangshan           2009-03-06  3160  				save_arg(ptrdi=
ff_t);
fef20d9c1380f0 Frederic Weisbecker     2009-03-06  3161  				break;
a4e94ef0dd391e Zhaolei                 2009-03-27  3162  			case FORMAT_TYP=
E_UBYTE:
a4e94ef0dd391e Zhaolei                 2009-03-27  3163  			case FORMAT_TYP=
E_BYTE:
a4e94ef0dd391e Zhaolei                 2009-03-27  3164  				save_arg(char);
a4e94ef0dd391e Zhaolei                 2009-03-27  3165  				break;
fef20d9c1380f0 Frederic Weisbecker     2009-03-06  3166  			case FORMAT_TYP=
E_USHORT:
fef20d9c1380f0 Frederic Weisbecker     2009-03-06  3167  			case FORMAT_TYP=
E_SHORT:
4370aa4aa75391 Lai Jiangshan           2009-03-06  3168  				save_arg(short=
);
fef20d9c1380f0 Frederic Weisbecker     2009-03-06  3169  				break;
4370aa4aa75391 Lai Jiangshan           2009-03-06  3170  			default:
fef20d9c1380f0 Frederic Weisbecker     2009-03-06  3171  				save_arg(int);
fef20d9c1380f0 Frederic Weisbecker     2009-03-06  3172  			}
4370aa4aa75391 Lai Jiangshan           2009-03-06  3173  		}
4370aa4aa75391 Lai Jiangshan           2009-03-06  3174  	}
fef20d9c1380f0 Frederic Weisbecker     2009-03-06  3175  =

b006f19b055f90 Rasmus Villemoes        2015-11-06  3176  out:
7b9186f5eb0b17 Andr=C3=A9 Goddard Rosa      2009-12-14  3177  	return (u32 =
*)(PTR_ALIGN(str, sizeof(u32))) - bin_buf;
fef20d9c1380f0 Frederic Weisbecker     2009-03-06  3178  #undef save_arg
4370aa4aa75391 Lai Jiangshan           2009-03-06  3179  }
4370aa4aa75391 Lai Jiangshan           2009-03-06  3180  EXPORT_SYMBOL_GPL(=
vbin_printf);
4370aa4aa75391 Lai Jiangshan           2009-03-06  3181  =


:::::: The code@line 3139 was first introduced by commit
:::::: 841a915d20c7b22fc4f36f12368daf94d9f8cb10 vsprintf: Do not have bprin=
tf dereference pointers

:::::: TO: Steven Rostedt (VMware) <rostedt@goodmis.org>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8594189857967670600==--

