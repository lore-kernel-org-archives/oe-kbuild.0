Content-Type: multipart/mixed; boundary="===============6476147556204978096=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] fbtft-bus.c:
Date: Sun, 28 Jun 2020 10:42:21 +0800
Message-ID: <202006281041.KPpdhpu4%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6476147556204978096==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200627045004.a46jbqtbiintu2nt@pesu-pes-edu>
References: <20200627045004.a46jbqtbiintu2nt@pesu-pes-edu>
TO: B K Karthik <bkkarthik@pesu.pes.edu>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: "Jan Sebastian G=C3=B6tte" <linux@jaseg.net>
TO: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
TO: dri-devel(a)lists.freedesktop.org
TO: linux-fbdev(a)vger.kernel.org
TO: devel(a)driverdev.osuosl.org
TO: linux-kernel(a)vger.kernel.org

Hi K,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on staging/staging-testing]
[also build test WARNING on v5.8-rc2 next-20200626]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use  as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/B-K-Karthik/fbtft-bus-c/20=
200627-125213
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git =
92cd1b5d65f5c67147c7da39a3c2ad7e6ff81027
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
compiler: gcc-9 (Debian 9.3.0-13) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/staging/fbtft/fbtft-bus.c:65:0: warning: failed to expand 'defin=
e_fbtft_write_reg', Wrong number of parameters for macro 'define_fbtft_writ=
e_reg'. [preprocessorErrorDirective]
   define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8)
   ^

# https://github.com/0day-ci/linux/commit/31b9aef1a7ba07b43bbfd554427fd34cf=
a8131f4
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 31b9aef1a7ba07b43bbfd554427fd34cfa8131f4
vim +65 drivers/staging/fbtft/fbtft-bus.c

c296d5f9957c03 Thomas Petazzoni   2014-12-31  64  =

31b9aef1a7ba07 B K Karthik        2020-06-27 @65  define_fbtft_write_reg(fb=
tft_write_reg8_bus8, u8, u8)
8d8825b420ffb3 Alfonso Lima Astor 2017-10-17  66  define_fbtft_write_reg(fb=
tft_write_reg16_bus8, __be16, u16, cpu_to_be16)
31b9aef1a7ba07 B K Karthik        2020-06-27  67  define_fbtft_write_reg(fb=
tft_write_reg16_bus16, u16, u16)
c296d5f9957c03 Thomas Petazzoni   2014-12-31  68  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6476147556204978096==--

