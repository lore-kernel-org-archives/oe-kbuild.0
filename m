Content-Type: multipart/mixed; boundary="===============0382887247285403127=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 4615/9759] drivers/fpga/zynq-fpga.c:245 zynq_fpga_has_sync() warn: impossible condition '(buf[2] == 153) => ((-128)-127 == 153)'
Date: Sun, 08 May 2022 23:34:55 +0800
Message-ID: <202205082354.VLuo1EgB-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0382887247285403127==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Nava kishore Manne <nava.manne@xilinx.com>
CC: Moritz Fischer <mdf@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   38a288f5941ef03752887ad86f2d85442358c99a
commit: ada14a023a641107da1ada546e1d345ca3dc78a5 [4615/9759] fpga: zynq: Fi=
x incorrect variable type
:::::: branch date: 2 days ago
:::::: commit date: 2 weeks ago
config: csky-randconfig-m031-20220508 (https://download.01.org/0day-ci/arch=
ive/20220508/202205082354.VLuo1EgB-lkp(a)intel.com/config)
compiler: csky-linux-gcc (GCC) 11.3.0

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

b496df86ac1bbe Jason Gunthorpe    2017-02-01  238  /* Sanity check the prop=
osed bitstream. It must start with the sync word in
b496df86ac1bbe Jason Gunthorpe    2017-02-01  239   * the correct byte orde=
r, and be dword aligned. The input is a Xilinx .bin
b496df86ac1bbe Jason Gunthorpe    2017-02-01  240   * file with every 32 bi=
t quantity swapped.
b496df86ac1bbe Jason Gunthorpe    2017-02-01  241   */
ada14a023a6411 Nava kishore Manne 2022-04-21  242  static bool zynq_fpga_ha=
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


:::::: The code at line 245 was first introduced by commit
:::::: b496df86ac1bbe393a55ddbfed35d46e74ef9767 fpga zynq: Check the bitstr=
eam for validity

:::::: TO: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0382887247285403127==--

