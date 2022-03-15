Content-Type: multipart/mixed; boundary="===============1891074863620221847=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 2/2] fbdev: Fix cfb_imageblit() for arbitrary image widths
Date: Tue, 15 Mar 2022 14:03:12 +0800
Message-ID: <202203151313.gyWGP0AL-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1891074863620221847==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220313192952.12058-3-tzimmermann@suse.de>
References: <20220313192952.12058-3-tzimmermann@suse.de>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: daniel(a)ffwll.ch
TO: deller(a)gmx.de
TO: m.szyprowski(a)samsung.com
TO: geert(a)linux-m68k.org
TO: javierm(a)redhat.com
TO: sam(a)ravnborg.org
CC: linux-fbdev(a)vger.kernel.org
CC: dri-devel(a)lists.freedesktop.org
CC: Thomas Zimmermann <tzimmermann@suse.de>

Hi Thomas,

I love your patch! Perhaps something to improve:

[auto build test WARNING on next-20220310]
[cannot apply to linus/master v5.17-rc7 v5.17-rc6 v5.17-rc5 v5.17-rc8]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Thomas-Zimmermann/fbdev-Fi=
x-image-blitting-for-arbitrary-image-widths/20220314-033209
base:    71941773e143369a73c9c4a3b62fbb60736a1182
:::::: branch date: 34 hours ago
:::::: commit date: 34 hours ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20315/202203151313.gyWGP0AL-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0467eb=
2cb7654c15ae366967ef35093c5724c416)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/9410e2f8731c2247eb12bf3b2=
c46d169917bb9b4
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Thomas-Zimmermann/fbdev-Fix-image-=
blitting-for-arbitrary-image-widths/20220314-033209
        git checkout 9410e2f8731c2247eb12bf3b2c46d169917bb9b4
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
               ^
   include/linux/rcupdate.h:877:41: note: expanded from macro '__is_kvfree_=
rcu_offset'
   #define __is_kvfree_rcu_offset(offset) ((offset) < 4096)
                                           ^~~~~~~~~~~~~~~
   kernel/rcu/tree.c:3129:2: note: Taking false branch
           if (__is_kvfree_rcu_offset((unsigned long)func))
           ^
   kernel/rcu/tree.c:3140:6: note: Assuming the condition is false
           if (unlikely(rcu_rdp_is_offloaded(rdp))) {
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   kernel/rcu/tree.c:3140:2: note: Taking true branch
           if (unlikely(rcu_rdp_is_offloaded(rdp))) {
           ^
   kernel/rcu/tree.c:3141:3: note: 2nd function call argument is an uniniti=
alized value
                   __call_rcu_nocb_wake(rdp, was_alldone, flags); /* unlock=
s */
                   ^                         ~~~~~~~~~~~
   Suppressed 51 warnings (51 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
   drivers/acpi/acpica/utnonansi.c:135:2: warning: Call to function 'strcpy=
' is insecure as it does not provide bounding of the memory buffer. Replace=
 unbounded copy functions with analogous functions that support length argu=
ments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcp=
y]
           strcpy(dest, source);
           ^~~~~~
   drivers/acpi/acpica/utnonansi.c:135:2: note: Call to function 'strcpy' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcpy'. CWE-119
           strcpy(dest, source);
           ^~~~~~
   drivers/acpi/acpica/utnonansi.c:146:2: warning: Call to function 'strcat=
' is insecure as it does not provide bounding of the memory buffer. Replace=
 unbounded copy functions with analogous functions that support length argu=
ments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcp=
y]
           strcat(dest, source);
           ^~~~~~
   drivers/acpi/acpica/utnonansi.c:146:2: note: Call to function 'strcat' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcat'. CWE-119
           strcat(dest, source);
           ^~~~~~
   drivers/acpi/acpica/utnonansi.c:163:2: warning: Call to function 'strnca=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'strncat_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncat(dest, source, max_transfer_length);
           ^~~~~~~
   drivers/acpi/acpica/utnonansi.c:163:2: note: Call to function 'strncat' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'strncat_s' in case of C11
           strncat(dest, source, max_transfer_length);
           ^~~~~~~
   drivers/acpi/acpica/utnonansi.c:171:2: warning: Call to function 'strncp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'strncpy_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(dest, source, dest_size);
           ^~~~~~~
   drivers/acpi/acpica/utnonansi.c:171:2: note: Call to function 'strncpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'strncpy_s' in case of C11
           strncpy(dest, source, dest_size);
           ^~~~~~~
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   drivers/video/fbdev/core/fbcvt.c:233:3: warning: Value stored to 'off' i=
s never read [clang-analyzer-deadcode.DeadStores]
                   off +=3D scnprintf(buf + off, size - off,
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/core/fbcvt.c:233:3: note: Value stored to 'off' is n=
ever read
                   off +=3D scnprintf(buf + off, size - off,
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/core/fbcvt.c:252:4: warning: Value stored to 'off' i=
s never read [clang-analyzer-deadcode.DeadStores]
                           off +=3D scnprintf(buf + off, size - off, "-R");
                           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/core/fbcvt.c:252:4: note: Value stored to 'off' is n=
ever read
                           off +=3D scnprintf(buf + off, size - off, "-R");
                           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/core/fbcvt.c:298:2: warning: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&cvt, 0, sizeof(cvt));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/video/fbdev/core/fbcvt.c:298:2: note: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11
           memset(&cvt, 0, sizeof(cvt));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
>> drivers/video/fbdev/core/cfbimgblt.c:304:10: warning: The expression is =
an uninitialized value. The computed value will also be garbage [clang-anal=
yzer-core.uninitialized.Assign]
                   for (; j--; ) {
                          ^
   drivers/video/fbdev/core/cfbimgblt.c:326:6: note: Assuming field 'state'=
 is equal to FBINFO_STATE_RUNNING
           if (p->state !=3D FBINFO_STATE_RUNNING)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/core/cfbimgblt.c:326:2: note: Taking false branch
           if (p->state !=3D FBINFO_STATE_RUNNING)
           ^
   drivers/video/fbdev/core/cfbimgblt.c:337:6: note: Assuming field 'fb_syn=
c' is null
           if (p->fbops->fb_sync)
               ^~~~~~~~~~~~~~~~~
   drivers/video/fbdev/core/cfbimgblt.c:337:2: note: Taking false branch
           if (p->fbops->fb_sync)
           ^
   drivers/video/fbdev/core/cfbimgblt.c:340:6: note: Assuming field 'depth'=
 is equal to 1
           if (image->depth =3D=3D 1) {
               ^~~~~~~~~~~~~~~~~
   drivers/video/fbdev/core/cfbimgblt.c:340:2: note: Taking true branch
           if (image->depth =3D=3D 1) {
           ^
   drivers/video/fbdev/core/cfbimgblt.c:341:7: note: Assuming field 'visual=
' is not equal to FB_VISUAL_TRUECOLOR
                   if (p->fix.visual =3D=3D FB_VISUAL_TRUECOLOR ||
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/core/cfbimgblt.c:341:7: note: Left side of '||' is f=
alse
   drivers/video/fbdev/core/cfbimgblt.c:342:7: note: Assuming field 'visual=
' is not equal to FB_VISUAL_DIRECTCOLOR
                       p->fix.visual =3D=3D FB_VISUAL_DIRECTCOLOR) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/core/cfbimgblt.c:341:3: note: Taking false branch
                   if (p->fix.visual =3D=3D FB_VISUAL_TRUECOLOR ||
                   ^
   drivers/video/fbdev/core/cfbimgblt.c:350:7: note: Assuming the condition=
 is true
                   if (32 % bpp =3D=3D 0 && !start_index && !pitch_index &&
                       ^~~~~~~~~~~~~
   drivers/video/fbdev/core/cfbimgblt.c:350:7: note: Left side of '&&' is t=
rue
   drivers/video/fbdev/core/cfbimgblt.c:350:24: note: Assuming 'start_index=
' is 0
                   if (32 % bpp =3D=3D 0 && !start_index && !pitch_index &&
                                        ^~~~~~~~~~~~
   drivers/video/fbdev/core/cfbimgblt.c:350:7: note: Left side of '&&' is t=
rue
                   if (32 % bpp =3D=3D 0 && !start_index && !pitch_index &&
                       ^
   drivers/video/fbdev/core/cfbimgblt.c:350:40: note: Assuming 'pitch_index=
' is 0
                   if (32 % bpp =3D=3D 0 && !start_index && !pitch_index &&
                                                        ^~~~~~~~~~~~
   drivers/video/fbdev/core/cfbimgblt.c:350:7: note: Left side of '&&' is t=
rue
                   if (32 % bpp =3D=3D 0 && !start_index && !pitch_index &&
                       ^
   drivers/video/fbdev/core/cfbimgblt.c:351:8: note: Assuming the condition=
 is true
                       ((width & (32/bpp-1)) =3D=3D 0) &&
                        ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/core/cfbimgblt.c:350:7: note: Left side of '&&' is t=
rue
                   if (32 % bpp =3D=3D 0 && !start_index && !pitch_index &&
                       ^
   drivers/video/fbdev/core/cfbimgblt.c:352:7: note: Assuming 'bpp' is >=3D=
 8
                       bpp >=3D 8 && bpp <=3D 32)
                       ^~~~~~~~
   drivers/video/fbdev/core/cfbimgblt.c:350:7: note: Left side of '&&' is t=
rue
                   if (32 % bpp =3D=3D 0 && !start_index && !pitch_index &&
                       ^
   drivers/video/fbdev/core/cfbimgblt.c:352:19: note: Assuming 'bpp' is <=
=3D 32
                       bpp >=3D 8 && bpp <=3D 32)
                                   ^~~~~~~~~
   drivers/video/fbdev/core/cfbimgblt.c:350:3: note: Taking true branch
                   if (32 % bpp =3D=3D 0 && !start_index && !pitch_index &&
                   ^
   drivers/video/fbdev/core/cfbimgblt.c:353:4: note: Calling 'fast_imagebli=
t'
                           fast_imageblit(image, p, dst1, fgcolor, bgcolor);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/fbdev/core/cfbimgblt.c:227:9: note: 'j' declared without a=
n initial value
           int i, j, k;
                  ^
   drivers/video/fbdev/core/cfbimgblt.c:229:2: note: Control jumps to 'case=
 32:' @line 238
           switch (bpp) {
           ^
   drivers/video/fbdev/core/cfbimgblt.c:241:3: note:  Execution continues o=
n line 246
                   break;
                   ^
   drivers/video/fbdev/core/cfbimgblt.c:246:2: note: Loop condition is fals=
e. Execution continues on line 253
           for (i =3D ppw-1; i--; ) {
           ^
   drivers/video/fbdev/core/cfbimgblt.c:257:2: note: Loop condition is true=
.  Entering loop body
           for (i =3D 0; i < tablen; ++i)
           ^
   drivers/video/fbdev/core/cfbimgblt.c:257:2: note: Loop condition is true=
.  Entering loop body
   drivers/video/fbdev/core/cfbimgblt.c:257:2: note: Loop condition is fals=
e. Execution continues on line 260
   drivers/video/fbdev/core/cfbimgblt.c:260:2: note: Loop condition is true=
.  Entering loop body
           for (i =3D image->height; i--; ) {
           ^
   drivers/video/fbdev/core/cfbimgblt.c:270:3: note: 'Default' branch taken=
. Execution continues on line 304
                   switch (ppw) {
                   ^
   drivers/video/fbdev/core/cfbimgblt.c:304:10: note: The expression is an =
uninitialized value. The computed value will also be garbage
                   for (; j--; ) {
                          ^
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
   drivers/acpi/acpica/tbprint.c:70:2: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]

vim +304 drivers/video/fbdev/core/cfbimgblt.c

^1da177e4c3f415 drivers/video/cfbimgblt.c            Linus Torvalds    2005=
-04-16  206  =

^1da177e4c3f415 drivers/video/cfbimgblt.c            Linus Torvalds    2005=
-04-16  207  /*
^1da177e4c3f415 drivers/video/cfbimgblt.c            Linus Torvalds    2005=
-04-16  208   * fast_imageblit - optimized monochrome color expansion
^1da177e4c3f415 drivers/video/cfbimgblt.c            Linus Torvalds    2005=
-04-16  209   *
^1da177e4c3f415 drivers/video/cfbimgblt.c            Linus Torvalds    2005=
-04-16  210   * Only if:  bits_per_pixel =3D=3D 8, 16, or 32
^1da177e4c3f415 drivers/video/cfbimgblt.c            Linus Torvalds    2005=
-04-16  211   *           image->width is divisible by pixel/dword (ppw);
^1da177e4c3f415 drivers/video/cfbimgblt.c            Linus Torvalds    2005=
-04-16  212   *           fix->line_legth is divisible by 4;
^1da177e4c3f415 drivers/video/cfbimgblt.c            Linus Torvalds    2005=
-04-16  213   *           beginning and end of a scanline is dword aligned
^1da177e4c3f415 drivers/video/cfbimgblt.c            Linus Torvalds    2005=
-04-16  214   */
^1da177e4c3f415 drivers/video/cfbimgblt.c            Linus Torvalds    2005=
-04-16  215  static inline void fast_imageblit(const struct fb_image *image=
, struct fb_info *p,
^1da177e4c3f415 drivers/video/cfbimgblt.c            Linus Torvalds    2005=
-04-16  216  				  u8 __iomem *dst1, u32 fgcolor,
^1da177e4c3f415 drivers/video/cfbimgblt.c            Linus Torvalds    2005=
-04-16  217  				  u32 bgcolor)
^1da177e4c3f415 drivers/video/cfbimgblt.c            Linus Torvalds    2005=
-04-16  218  {
^1da177e4c3f415 drivers/video/cfbimgblt.c            Linus Torvalds    2005=
-04-16  219  	u32 fgx =3D fgcolor, bgx =3D bgcolor, bpp =3D p->var.bits_per=
_pixel;
^1da177e4c3f415 drivers/video/cfbimgblt.c            Linus Torvalds    2005=
-04-16  220  	u32 ppw =3D 32/bpp, spitch =3D (image->width + 7)/8;
9410e2f8731c224 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022=
-03-13  221  	u32 bit_mask, eorx, shift;
^1da177e4c3f415 drivers/video/cfbimgblt.c            Linus Torvalds    2005=
-04-16  222  	const char *s =3D image->data, *src;
^1da177e4c3f415 drivers/video/cfbimgblt.c            Linus Torvalds    2005=
-04-16  223  	u32 __iomem *dst;
d95159cf1b12e8e drivers/video/cfbimgblt.c            Helge Deller      2006=
-12-08  224  	const u32 *tab =3D NULL;
0d03011894d2324 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022=
-02-23  225  	size_t tablen;
0d03011894d2324 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022=
-02-23  226  	u32 colortab[16];
^1da177e4c3f415 drivers/video/cfbimgblt.c            Linus Torvalds    2005=
-04-16  227  	int i, j, k;
^1da177e4c3f415 drivers/video/cfbimgblt.c            Linus Torvalds    2005=
-04-16  228  =

^1da177e4c3f415 drivers/video/cfbimgblt.c            Linus Torvalds    2005=
-04-16  229  	switch (bpp) {
^1da177e4c3f415 drivers/video/cfbimgblt.c            Linus Torvalds    2005=
-04-16  230  	case 8:
e4c690e061b9091 drivers/video/cfbimgblt.c            Anton Vorontsov   2008=
-04-28  231  		tab =3D fb_be_math(p) ? cfb_tab8_be : cfb_tab8_le;
0d03011894d2324 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022=
-02-23  232  		tablen =3D 16;
^1da177e4c3f415 drivers/video/cfbimgblt.c            Linus Torvalds    2005=
-04-16  233  		break;
^1da177e4c3f415 drivers/video/cfbimgblt.c            Linus Torvalds    2005=
-04-16  234  	case 16:
e4c690e061b9091 drivers/video/cfbimgblt.c            Anton Vorontsov   2008=
-04-28  235  		tab =3D fb_be_math(p) ? cfb_tab16_be : cfb_tab16_le;
0d03011894d2324 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022=
-02-23  236  		tablen =3D 4;
^1da177e4c3f415 drivers/video/cfbimgblt.c            Linus Torvalds    2005=
-04-16  237  		break;
^1da177e4c3f415 drivers/video/cfbimgblt.c            Linus Torvalds    2005=
-04-16  238  	case 32:
^1da177e4c3f415 drivers/video/cfbimgblt.c            Linus Torvalds    2005=
-04-16  239  		tab =3D cfb_tab32;
0d03011894d2324 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022=
-02-23  240  		tablen =3D 2;
^1da177e4c3f415 drivers/video/cfbimgblt.c            Linus Torvalds    2005=
-04-16  241  		break;
0d03011894d2324 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022=
-02-23  242  	default:
0d03011894d2324 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022=
-02-23  243  		return;
^1da177e4c3f415 drivers/video/cfbimgblt.c            Linus Torvalds    2005=
-04-16  244  	}
^1da177e4c3f415 drivers/video/cfbimgblt.c            Linus Torvalds    2005=
-04-16  245  =

^1da177e4c3f415 drivers/video/cfbimgblt.c            Linus Torvalds    2005=
-04-16  246  	for (i =3D ppw-1; i--; ) {
^1da177e4c3f415 drivers/video/cfbimgblt.c            Linus Torvalds    2005=
-04-16  247  		fgx <<=3D bpp;
^1da177e4c3f415 drivers/video/cfbimgblt.c            Linus Torvalds    2005=
-04-16  248  		bgx <<=3D bpp;
^1da177e4c3f415 drivers/video/cfbimgblt.c            Linus Torvalds    2005=
-04-16  249  		fgx |=3D fgcolor;
^1da177e4c3f415 drivers/video/cfbimgblt.c            Linus Torvalds    2005=
-04-16  250  		bgx |=3D bgcolor;
^1da177e4c3f415 drivers/video/cfbimgblt.c            Linus Torvalds    2005=
-04-16  251  	}
^1da177e4c3f415 drivers/video/cfbimgblt.c            Linus Torvalds    2005=
-04-16  252  =

^1da177e4c3f415 drivers/video/cfbimgblt.c            Linus Torvalds    2005=
-04-16  253  	bit_mask =3D (1 << ppw) - 1;
^1da177e4c3f415 drivers/video/cfbimgblt.c            Linus Torvalds    2005=
-04-16  254  	eorx =3D fgx ^ bgx;
^1da177e4c3f415 drivers/video/cfbimgblt.c            Linus Torvalds    2005=
-04-16  255  	k =3D image->width/ppw;
^1da177e4c3f415 drivers/video/cfbimgblt.c            Linus Torvalds    2005=
-04-16  256  =

0d03011894d2324 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022=
-02-23  257  	for (i =3D 0; i < tablen; ++i)
0d03011894d2324 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022=
-02-23  258  		colortab[i] =3D (tab[i] & eorx) ^ bgx;
0d03011894d2324 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022=
-02-23  259  =

^1da177e4c3f415 drivers/video/cfbimgblt.c            Linus Torvalds    2005=
-04-16  260  	for (i =3D image->height; i--; ) {
0d03011894d2324 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022=
-02-23  261  		dst =3D (u32 __iomem *)dst1;
9410e2f8731c224 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022=
-03-13  262  		shift =3D 8;
0d03011894d2324 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022=
-02-23  263  		src =3D s;
^1da177e4c3f415 drivers/video/cfbimgblt.c            Linus Torvalds    2005=
-04-16  264  =

9410e2f8731c224 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022=
-03-13  265  		/*
9410e2f8731c224 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022=
-03-13  266  		 * Manually unroll the per-line copying loop for better
9410e2f8731c224 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022=
-03-13  267  		 * performance. This works until we processed the last
9410e2f8731c224 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022=
-03-13  268  		 * completely filled source byte (inclusive).
9410e2f8731c224 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022=
-03-13  269  		 */
0d03011894d2324 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022=
-02-23  270  		switch (ppw) {
0d03011894d2324 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022=
-02-23  271  		case 4: /* 8 bpp */
9410e2f8731c224 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022=
-03-13  272  			for (j =3D k; j >=3D 2; j -=3D 2, ++src) {
0d03011894d2324 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022=
-02-23  273  				FB_WRITEL(colortab[(*src >> 4) & bit_mask], dst++);
0d03011894d2324 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022=
-02-23  274  				FB_WRITEL(colortab[(*src >> 0) & bit_mask], dst++);
0d03011894d2324 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022=
-02-23  275  			}
0d03011894d2324 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022=
-02-23  276  			break;
0d03011894d2324 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022=
-02-23  277  		case 2: /* 16 bpp */
9410e2f8731c224 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022=
-03-13  278  			for (j =3D k; j >=3D 4; j -=3D 4, ++src) {
0d03011894d2324 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022=
-02-23  279  				FB_WRITEL(colortab[(*src >> 6) & bit_mask], dst++);
0d03011894d2324 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022=
-02-23  280  				FB_WRITEL(colortab[(*src >> 4) & bit_mask], dst++);
0d03011894d2324 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022=
-02-23  281  				FB_WRITEL(colortab[(*src >> 2) & bit_mask], dst++);
0d03011894d2324 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022=
-02-23  282  				FB_WRITEL(colortab[(*src >> 0) & bit_mask], dst++);
0d03011894d2324 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022=
-02-23  283  			}
0d03011894d2324 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022=
-02-23  284  			break;
0d03011894d2324 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022=
-02-23  285  		case 1: /* 32 bpp */
9410e2f8731c224 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022=
-03-13  286  			for (j =3D k; j >=3D 8; j -=3D 8, ++src) {
0d03011894d2324 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022=
-02-23  287  				FB_WRITEL(colortab[(*src >> 7) & bit_mask], dst++);
0d03011894d2324 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022=
-02-23  288  				FB_WRITEL(colortab[(*src >> 6) & bit_mask], dst++);
0d03011894d2324 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022=
-02-23  289  				FB_WRITEL(colortab[(*src >> 5) & bit_mask], dst++);
0d03011894d2324 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022=
-02-23  290  				FB_WRITEL(colortab[(*src >> 4) & bit_mask], dst++);
0d03011894d2324 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022=
-02-23  291  				FB_WRITEL(colortab[(*src >> 3) & bit_mask], dst++);
0d03011894d2324 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022=
-02-23  292  				FB_WRITEL(colortab[(*src >> 2) & bit_mask], dst++);
0d03011894d2324 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022=
-02-23  293  				FB_WRITEL(colortab[(*src >> 1) & bit_mask], dst++);
0d03011894d2324 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022=
-02-23  294  				FB_WRITEL(colortab[(*src >> 0) & bit_mask], dst++);
^1da177e4c3f415 drivers/video/cfbimgblt.c            Linus Torvalds    2005=
-04-16  295  			}
0d03011894d2324 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022=
-02-23  296  			break;
0d03011894d2324 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022=
-02-23  297  		}
0d03011894d2324 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022=
-02-23  298  =

9410e2f8731c224 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022=
-03-13  299  		/*
9410e2f8731c224 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022=
-03-13  300  		 * For image widths that are not a multiple of 8, there
9410e2f8731c224 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022=
-03-13  301  		 * are trailing pixels left on the current line. Print
9410e2f8731c224 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022=
-03-13  302  		 * them as well.
9410e2f8731c224 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022=
-03-13  303  		 */
9410e2f8731c224 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022=
-03-13 @304  		for (; j--; ) {
9410e2f8731c224 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022=
-03-13  305  			shift -=3D ppw;
9410e2f8731c224 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022=
-03-13  306  			FB_WRITEL(colortab[(*src >> shift) & bit_mask], dst++);
9410e2f8731c224 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022=
-03-13  307  			if (!shift) {
9410e2f8731c224 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022=
-03-13  308  				shift =3D 8;
9410e2f8731c224 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022=
-03-13  309  				++src;
9410e2f8731c224 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022=
-03-13  310  			}
9410e2f8731c224 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022=
-03-13  311  		}
9410e2f8731c224 drivers/video/fbdev/core/cfbimgblt.c Thomas Zimmermann 2022=
-03-13  312  =

^1da177e4c3f415 drivers/video/cfbimgblt.c            Linus Torvalds    2005=
-04-16  313  		dst1 +=3D p->fix.line_length;
^1da177e4c3f415 drivers/video/cfbimgblt.c            Linus Torvalds    2005=
-04-16  314  		s +=3D spitch;
^1da177e4c3f415 drivers/video/cfbimgblt.c            Linus Torvalds    2005=
-04-16  315  	}
^1da177e4c3f415 drivers/video/cfbimgblt.c            Linus Torvalds    2005=
-04-16  316  }
^1da177e4c3f415 drivers/video/cfbimgblt.c            Linus Torvalds    2005=
-04-16  317  =


---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1891074863620221847==--

