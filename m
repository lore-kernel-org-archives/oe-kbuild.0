Content-Type: multipart/mixed; boundary="===============6453473939927626839=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [cxl:preview 37/49] kernel/resource.c:1823:22-23: WARNING this kind of initialization is deprecated
Date: Thu, 23 Jun 2022 18:17:12 +0800
Message-ID: <202206231855.rDlKL41m-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6453473939927626839==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Alison Schofield <alison.schofield@intel.com>
CC: Vishal Verma <vishal.l.verma@intel.com>
CC: Ira Weiny <ira.weiny@intel.com>
CC: Ben Widawsky <ben.widawsky@intel.com>
CC: Dan Williams <dan.j.williams@intel.com>
CC: linux-kernel(a)vger.kernel.org
TO: Dan Williams <dan.j.williams@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git preview
head:   b2d4fd5c97b59f622e6c45ac51020cdcd66bb022
commit: 6f2443c3ffee6675ef14a4b1256400a9c8a652ca [37/49] resource: Introduc=
e alloc_free_mem_region()
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: arm-randconfig-c003-20220622 (https://download.01.org/0day-ci/archi=
ve/20220623/202206231855.rDlKL41m-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> kernel/resource.c:1823:22-23: WARNING this kind of initialization is dep=
recated

vim +1823 kernel/resource.c

6f2443c3ffee66 Dan Williams 2022-05-20  1820  =

6f2443c3ffee66 Dan Williams 2022-05-20  1821  static void remove_free_mem_r=
egion(void *_res)
6f2443c3ffee66 Dan Williams 2022-05-20  1822  {
6f2443c3ffee66 Dan Williams 2022-05-20 @1823  	struct resource *res =3D res;
6f2443c3ffee66 Dan Williams 2022-05-20  1824  =

6f2443c3ffee66 Dan Williams 2022-05-20  1825  	if (res->parent)
6f2443c3ffee66 Dan Williams 2022-05-20  1826  		remove_resource(res);
6f2443c3ffee66 Dan Williams 2022-05-20  1827  	free_resource(res);
6f2443c3ffee66 Dan Williams 2022-05-20  1828  }
6f2443c3ffee66 Dan Williams 2022-05-20  1829  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6453473939927626839==--

