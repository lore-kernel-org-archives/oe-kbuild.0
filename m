Content-Type: multipart/mixed; boundary="===============9109763596590704460=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/cxl/core/mbox.c:478:55: warning: Parameter 'uuid' can be declared with const [constParameter]
Date: Sun, 22 May 2022 10:09:40 +0800
Message-ID: <202205221019.c5Gwo0QB-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9109763596590704460==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Dan Williams <dan.j.williams@intel.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   eaea45fc0e7b6ae439526b4a41d91230c8517336
commit: 4faf31b43468c58e2c8c91cc5fa26f08a6b733be cxl/mbox: Move mailbox and=
 other non-PCI specific infrastructure to the core
date:   8 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 8 months ago
compiler: m68k-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 4faf31b43468c58e2c8c91cc5fa26f08a6b733be
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/cxl/core/mbox.c:478:55: warning: Parameter 'uuid' can be declare=
d with const [constParameter]
   static int cxl_xfer_log(struct cxl_mem *cxlm, uuid_t *uuid, u32 size, u8=
 *out)
                                                         ^

vim +/uuid +478 drivers/cxl/core/mbox.c

4faf31b43468c5 Dan Williams 2021-09-08  477  =

4faf31b43468c5 Dan Williams 2021-09-08 @478  static int cxl_xfer_log(struct=
 cxl_mem *cxlm, uuid_t *uuid, u32 size, u8 *out)
4faf31b43468c5 Dan Williams 2021-09-08  479  {
4faf31b43468c5 Dan Williams 2021-09-08  480  	u32 remaining =3D size;
4faf31b43468c5 Dan Williams 2021-09-08  481  	u32 offset =3D 0;
4faf31b43468c5 Dan Williams 2021-09-08  482  =

4faf31b43468c5 Dan Williams 2021-09-08  483  	while (remaining) {
4faf31b43468c5 Dan Williams 2021-09-08  484  		u32 xfer_size =3D min_t(u32,=
 remaining, cxlm->payload_size);
4faf31b43468c5 Dan Williams 2021-09-08  485  		struct cxl_mbox_get_log {
4faf31b43468c5 Dan Williams 2021-09-08  486  			uuid_t uuid;
4faf31b43468c5 Dan Williams 2021-09-08  487  			__le32 offset;
4faf31b43468c5 Dan Williams 2021-09-08  488  			__le32 length;
4faf31b43468c5 Dan Williams 2021-09-08  489  		} __packed log =3D {
4faf31b43468c5 Dan Williams 2021-09-08  490  			.uuid =3D *uuid,
4faf31b43468c5 Dan Williams 2021-09-08  491  			.offset =3D cpu_to_le32(off=
set),
4faf31b43468c5 Dan Williams 2021-09-08  492  			.length =3D cpu_to_le32(xfe=
r_size)
4faf31b43468c5 Dan Williams 2021-09-08  493  		};
4faf31b43468c5 Dan Williams 2021-09-08  494  		int rc;
4faf31b43468c5 Dan Williams 2021-09-08  495  =

4faf31b43468c5 Dan Williams 2021-09-08  496  		rc =3D cxl_mem_mbox_send_cmd=
(cxlm, CXL_MBOX_OP_GET_LOG, &log,
4faf31b43468c5 Dan Williams 2021-09-08  497  					   sizeof(log), out, xfer=
_size);
4faf31b43468c5 Dan Williams 2021-09-08  498  		if (rc < 0)
4faf31b43468c5 Dan Williams 2021-09-08  499  			return rc;
4faf31b43468c5 Dan Williams 2021-09-08  500  =

4faf31b43468c5 Dan Williams 2021-09-08  501  		out +=3D xfer_size;
4faf31b43468c5 Dan Williams 2021-09-08  502  		remaining -=3D xfer_size;
4faf31b43468c5 Dan Williams 2021-09-08  503  		offset +=3D xfer_size;
4faf31b43468c5 Dan Williams 2021-09-08  504  	}
4faf31b43468c5 Dan Williams 2021-09-08  505  =

4faf31b43468c5 Dan Williams 2021-09-08  506  	return 0;
4faf31b43468c5 Dan Williams 2021-09-08  507  }
4faf31b43468c5 Dan Williams 2021-09-08  508  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============9109763596590704460==--

