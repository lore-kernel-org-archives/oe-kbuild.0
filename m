Content-Type: multipart/mixed; boundary="===============6449526515500569487=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 1/5] fpga: zynq: Fix incorrect variable type
Date: Sun, 03 Apr 2022 21:05:24 +0800
Message-ID: <202204032008.onV3JviK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6449526515500569487==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220403051641.3867610-2-nava.manne@xilinx.com>
References: <20220403051641.3867610-2-nava.manne@xilinx.com>
TO: Nava kishore Manne <nava.manne@xilinx.com>

Hi Nava,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.17 next-20220401]
[cannot apply to xilinx-xlnx/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Nava-kishore-Manne/f=
pga-zynq-Fix-incorrect-variable-type/20220403-141639
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
be2d3ecedd9911fbfd7e55cc9ceac5f8b79ae4cf
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: csky-randconfig-m031-20220403 (https://download.01.org/0day-ci/arch=
ive/20220403/202204032008.onV3JviK-lkp(a)intel.com/config)
compiler: csky-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/fpga/zynq-fpga.c:245 zynq_fpga_has_sync() warn: impossible conditio=
n '(buf[2] =3D=3D 153) =3D> ((-128)-127 =3D=3D 153)'

Old smatch warnings:
drivers/fpga/zynq-fpga.c:246 zynq_fpga_has_sync() warn: impossible conditio=
n '(buf[3] =3D=3D 170) =3D> ((-128)-127 =3D=3D 170)'

vim +245 drivers/fpga/zynq-fpga.c

37784706bf9e3b Moritz Fischer     2015-10-16  237  =

0269b45231586f Nava kishore Manne 2022-04-03  238  /* Sanity check the prop=
osed bitstream. The sync word must be found in the
0269b45231586f Nava kishore Manne 2022-04-03  239   * correct byte order an=
d it should be dword aligned. The input is a
0269b45231586f Nava kishore Manne 2022-04-03  240   * Xilinx.bin file with =
every 32 bit quantity swapped.
b496df86ac1bbe Jason Gunthorpe    2017-02-01  241   */
0269b45231586f Nava kishore Manne 2022-04-03  242  static bool zynq_fpga_ha=
s_sync(const char *buf, size_t count)
b496df86ac1bbe Jason Gunthorpe    2017-02-01  243  {
b496df86ac1bbe Jason Gunthorpe    2017-02-01  244  	for (; count >=3D 4; bu=
f +=3D 4, count -=3D 4)
b496df86ac1bbe Jason Gunthorpe    2017-02-01 @245  		if (buf[0] =3D=3D 0x66=
 && buf[1] =3D=3D 0x55 && buf[2] =3D=3D 0x99 &&
b496df86ac1bbe Jason Gunthorpe    2017-02-01  246  		    buf[3] =3D=3D 0xaa)
b496df86ac1bbe Jason Gunthorpe    2017-02-01  247  			return true;
b496df86ac1bbe Jason Gunthorpe    2017-02-01  248  	return false;
b496df86ac1bbe Jason Gunthorpe    2017-02-01  249  }
b496df86ac1bbe Jason Gunthorpe    2017-02-01  250  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6449526515500569487==--

