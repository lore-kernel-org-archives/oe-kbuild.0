Content-Type: multipart/mixed; boundary="===============3259037043763674383=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [xlnx:xlnx_rebase_v5.4 144/1296] drivers/dma/xilinx/xilinx_dpdma.c:442:24: warning: Checking if unsigned expression 'size' is less than zero. [unsignedLessThanZero]
Date: Fri, 08 May 2020 09:51:38 +0800
Message-ID: <202005080914.GbPA7UyK%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3259037043763674383==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-arm-kernel(a)lists.infradead.org
TO: Hyun Kwon <hyun.kwon@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>
CC: Rohit Visavalia <rvisaval@xilinx.com>
CC: Tejas Upadhyay <tejasu@xilinx.com>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.4
head:   0b197959bbbdb68e1da974bd013339f08704b178
commit: b78c51347044f6c34b8c6542a62255950f72bdc2 [144/1296] dma: xilinx: dp=
dma: Add the Xilinx DisplayPort DMA engine driver
:::::: branch date: 2 days ago
:::::: commit date: 3 weeks ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/dma/xilinx/xilinx_dpdma.c:442:24: warning: Checking if unsigned =
expression 'size' is less than zero. [unsignedLessThanZero]
    if (*pos !=3D 0 || size <=3D 0)
                          ^
   drivers/dma/xilinx/xilinx_dpdma.c:484:11: warning: Checking if unsigned =
expression 'size' is less than zero. [unsignedLessThanZero]
    if (size <=3D 0)
             ^

# https://github.com/Xilinx/linux-xlnx/commit/b78c51347044f6c34b8c6542a6225=
5950f72bdc2
git remote add xlnx https://github.com/Xilinx/linux-xlnx
git remote update xlnx
git checkout b78c51347044f6c34b8c6542a62255950f72bdc2
vim +/size +442 drivers/dma/xilinx/xilinx_dpdma.c

b78c51347044f6 Hyun Kwon 2014-06-13  433  =

b78c51347044f6 Hyun Kwon 2014-06-13  434  static ssize_t xilinx_dpdma_debug=
fs_write(struct file *f, const char __user
b78c51347044f6 Hyun Kwon 2014-06-13  435  					       *buf, size_t size, lo=
ff_t *pos)
b78c51347044f6 Hyun Kwon 2014-06-13  436  {
b78c51347044f6 Hyun Kwon 2014-06-13  437  	char *kern_buff, *kern_buff_star=
t;
b78c51347044f6 Hyun Kwon 2014-06-13  438  	char *dpdma_test_req;
b78c51347044f6 Hyun Kwon 2014-06-13  439  	int ret;
b78c51347044f6 Hyun Kwon 2014-06-13  440  	int i;
b78c51347044f6 Hyun Kwon 2014-06-13  441  =

b78c51347044f6 Hyun Kwon 2014-06-13 @442  	if (*pos !=3D 0 || size <=3D 0)
b78c51347044f6 Hyun Kwon 2014-06-13  443  		return -EINVAL;
b78c51347044f6 Hyun Kwon 2014-06-13  444  =

b78c51347044f6 Hyun Kwon 2014-06-13  445  	/* Supporting single instance of=
 test as of now*/
b78c51347044f6 Hyun Kwon 2014-06-13  446  	if (dpdma_debugfs.testcase !=3D =
DPDMA_TC_NONE)
b78c51347044f6 Hyun Kwon 2014-06-13  447  		return -EBUSY;
b78c51347044f6 Hyun Kwon 2014-06-13  448  =

b78c51347044f6 Hyun Kwon 2014-06-13  449  	kern_buff =3D kzalloc(size, GFP_=
KERNEL);
b78c51347044f6 Hyun Kwon 2014-06-13  450  	if (!kern_buff)
b78c51347044f6 Hyun Kwon 2014-06-13  451  		return -ENOMEM;
b78c51347044f6 Hyun Kwon 2014-06-13  452  	kern_buff_start =3D kern_buff;
b78c51347044f6 Hyun Kwon 2014-06-13  453  =

b78c51347044f6 Hyun Kwon 2014-06-13  454  	ret =3D strncpy_from_user(kern_b=
uff, buf, size);
b78c51347044f6 Hyun Kwon 2014-06-13  455  	if (ret < 0) {
b78c51347044f6 Hyun Kwon 2014-06-13  456  		kfree(kern_buff_start);
b78c51347044f6 Hyun Kwon 2014-06-13  457  		return ret;
b78c51347044f6 Hyun Kwon 2014-06-13  458  	}
b78c51347044f6 Hyun Kwon 2014-06-13  459  =

b78c51347044f6 Hyun Kwon 2014-06-13  460  	/* Read the testcase name from a=
 user request */
b78c51347044f6 Hyun Kwon 2014-06-13  461  	dpdma_test_req =3D strsep(&kern_=
buff, " ");
b78c51347044f6 Hyun Kwon 2014-06-13  462  =

b78c51347044f6 Hyun Kwon 2014-06-13  463  	for (i =3D 0; i < ARRAY_SIZE(dpd=
ma_debugfs_reqs); i++) {
b78c51347044f6 Hyun Kwon 2014-06-13  464  		if (!strcasecmp(dpdma_test_req,=
 dpdma_debugfs_reqs[i].req)) {
b78c51347044f6 Hyun Kwon 2014-06-13  465  			if (!dpdma_debugfs_reqs[i].wri=
te_handler(&kern_buff)) {
b78c51347044f6 Hyun Kwon 2014-06-13  466  				kfree(kern_buff_start);
b78c51347044f6 Hyun Kwon 2014-06-13  467  				return size;
b78c51347044f6 Hyun Kwon 2014-06-13  468  			}
b78c51347044f6 Hyun Kwon 2014-06-13  469  			break;
b78c51347044f6 Hyun Kwon 2014-06-13  470  		}
b78c51347044f6 Hyun Kwon 2014-06-13  471  	}
b78c51347044f6 Hyun Kwon 2014-06-13  472  	kfree(kern_buff_start);
b78c51347044f6 Hyun Kwon 2014-06-13  473  	return -EINVAL;
b78c51347044f6 Hyun Kwon 2014-06-13  474  }
b78c51347044f6 Hyun Kwon 2014-06-13  475  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============3259037043763674383==--

