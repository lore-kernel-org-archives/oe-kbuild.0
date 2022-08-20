Content-Type: multipart/mixed; boundary="===============2183031491767617272=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 471/2265] drivers/video/aperture.c:343:6: warning: Uninitialized variable: ret [uninitvar]
Date: Sat, 20 Aug 2022 19:09:13 +0800
Message-ID: <202208201908.TSFqBowK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2183031491767617272==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/v=
ideo/aperture.c:343:6: warning: Uninitialized variable: ret [uninitvar]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
CC: Javier Martinez Canillas <javierm@redhat.com>

Hi Thomas,

FYI, the error/warning was bisected to this commit, please ignore it if it'=
s irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   8755ae45a9e8ae883fa7f4eb0162830c55aacf14
commit: 9d69ef1838150c7d87afc1a87aa658c637217585 [471/2265] fbdev/core: Rem=
ove remove_conflicting_pci_framebuffers()
:::::: branch date: 32 hours ago
:::::: commit date: 5 weeks ago
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 9d69ef1838150c7d87afc1a87aa658c637217585
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/video/aperture.c:343:6: warning: Uninitialized variable: ret [un=
initvar]
    if (ret)
        ^
   drivers/video/aperture.c:332:20: note: Assuming condition is false
    for (bar =3D 0; bar < PCI_STD_NUM_BARS; ++bar) {
                      ^
   drivers/video/aperture.c:343:6: note: Uninitialized variable: ret
    if (ret)
        ^
--
>> drivers/video/fbdev/cirrusfb.c:2903:19: warning: Passing NULL after the =
last typed argument to a variadic function leads to undefined behaviour. [v=
arFuncNullUB]
         "CR3F", 0x3F,
                     ^
   drivers/video/fbdev/cirrusfb.c:2936:19: warning: Passing NULL after the =
last typed argument to a variadic function leads to undefined behaviour. [v=
arFuncNullUB]
         "SR1F", 0x1F,
                     ^

vim +343 drivers/video/aperture.c

7283f862bd991c Thomas Zimmermann 2022-06-22  331  =

7283f862bd991c Thomas Zimmermann 2022-06-22  332  	for (bar =3D 0; bar < PC=
I_STD_NUM_BARS; ++bar) {
7283f862bd991c Thomas Zimmermann 2022-06-22  333  		if (!(pci_resource_flag=
s(pdev, bar) & IORESOURCE_MEM))
7283f862bd991c Thomas Zimmermann 2022-06-22  334  			continue;
9d69ef1838150c Thomas Zimmermann 2022-07-18  335  =

7283f862bd991c Thomas Zimmermann 2022-06-22  336  		base =3D pci_resource_s=
tart(pdev, bar);
7283f862bd991c Thomas Zimmermann 2022-06-22  337  		size =3D pci_resource_l=
en(pdev, bar);
9d69ef1838150c Thomas Zimmermann 2022-07-18  338  		ret =3D aperture_remove=
_conflicting_devices(base, size, primary, name);
9d69ef1838150c Thomas Zimmermann 2022-07-18  339  		if (ret)
9d69ef1838150c Thomas Zimmermann 2022-07-18  340  			break;
7283f862bd991c Thomas Zimmermann 2022-06-22  341  	}
7283f862bd991c Thomas Zimmermann 2022-06-22  342  =

9d69ef1838150c Thomas Zimmermann 2022-07-18 @343  	if (ret)
9d69ef1838150c Thomas Zimmermann 2022-07-18  344  		return ret;
9d69ef1838150c Thomas Zimmermann 2022-07-18  345  =

9d69ef1838150c Thomas Zimmermann 2022-07-18  346  	/*
9d69ef1838150c Thomas Zimmermann 2022-07-18  347  	 * WARNING: Apparently w=
e must kick fbdev drivers before vgacon,
9d69ef1838150c Thomas Zimmermann 2022-07-18  348  	 * otherwise the vga fbd=
ev driver falls over.
9d69ef1838150c Thomas Zimmermann 2022-07-18  349  	 */
9d69ef1838150c Thomas Zimmermann 2022-07-18  350  	ret =3D vga_remove_vgaco=
n(pdev);
9d69ef1838150c Thomas Zimmermann 2022-07-18  351  	if (ret)
9d69ef1838150c Thomas Zimmermann 2022-07-18  352  		return ret;
9d69ef1838150c Thomas Zimmermann 2022-07-18  353  =

7283f862bd991c Thomas Zimmermann 2022-06-22  354  	return 0;
7283f862bd991c Thomas Zimmermann 2022-06-22  355  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2183031491767617272==--

