Content-Type: multipart/mixed; boundary="===============0464835601463615830=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [intel-lts:5.15/linux 22/62] drivers/clk/clk-cdcun1208.c:142 cdcun1208_clock_write_regs() error: uninitialized symbol 'ret'.
Date: Fri, 06 May 2022 10:15:16 +0800
Message-ID: <202205061047.ELhJyJOk-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0464835601463615830==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Svetoslav Stoilov <svetoslavx.stoilov@intel.com>
CC: nanli2x <nanx.li@intel.com>
CC: Daniele Alessandrelli <daniele.alessandrelli@intel.com>

tree:   https://github.com/intel/linux-intel-lts.git 5.15/linux
head:   d1713be6c1542fd79ad8926d90ae943cee9678dc
commit: c874fadc819ee0ce495a15c1d5c174489bca7b46 [22/62] clk: Add driver fo=
r CDCUN1208 fanout buffer
:::::: branch date: 2 weeks ago
:::::: commit date: 4 months ago
config: microblaze-randconfig-m031-20220505 (https://download.01.org/0day-c=
i/archive/20220506/202205061047.ELhJyJOk-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/clk/clk-cdcun1208.c:142 cdcun1208_clock_write_regs() error: uniniti=
alized symbol 'ret'.

vim +/ret +142 drivers/clk/clk-cdcun1208.c

c874fadc819ee0 Svetoslav Stoilov 2019-10-08  126  =

c874fadc819ee0 Svetoslav Stoilov 2019-10-08  127  static int
c874fadc819ee0 Svetoslav Stoilov 2019-10-08  128  cdcun1208_clock_write_reg=
s(struct i2c_client *client,
c874fadc819ee0 Svetoslav Stoilov 2019-10-08  129  			   const struct cdcun1=
208_clock_reg *regs,
c874fadc819ee0 Svetoslav Stoilov 2019-10-08  130  			   u32 len)
c874fadc819ee0 Svetoslav Stoilov 2019-10-08  131  {
c874fadc819ee0 Svetoslav Stoilov 2019-10-08  132  	int ret;
c874fadc819ee0 Svetoslav Stoilov 2019-10-08  133  	u32 i;
c874fadc819ee0 Svetoslav Stoilov 2019-10-08  134  =

c874fadc819ee0 Svetoslav Stoilov 2019-10-08  135  	for (i =3D 0; i < len; i=
++) {
c874fadc819ee0 Svetoslav Stoilov 2019-10-08  136  		ret =3D cdcun1208_clock=
_write_reg(client, regs[i].address,
c874fadc819ee0 Svetoslav Stoilov 2019-10-08  137  						regs[i].val);
c874fadc819ee0 Svetoslav Stoilov 2019-10-08  138  		if (ret < 0)
c874fadc819ee0 Svetoslav Stoilov 2019-10-08  139  			return ret;
c874fadc819ee0 Svetoslav Stoilov 2019-10-08  140  	}
c874fadc819ee0 Svetoslav Stoilov 2019-10-08  141  =

c874fadc819ee0 Svetoslav Stoilov 2019-10-08 @142  	return ret;
c874fadc819ee0 Svetoslav Stoilov 2019-10-08  143  }
c874fadc819ee0 Svetoslav Stoilov 2019-10-08  144  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0464835601463615830==--

