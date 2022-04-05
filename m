Content-Type: multipart/mixed; boundary="===============6173671480120914291=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [cxl:pending 3/13] drivers/cxl/core/mbox.c:223 cxl_mbox_cmd_ctor() warn: passing zero to 'PTR_ERR'
Date: Wed, 06 Apr 2022 05:05:05 +0800
Message-ID: <202204060533.8RYu7zFU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6173671480120914291==
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
TO: Alison Schofield <alison.schofield@intel.com>
CC: Dan Williams <dan.j.williams@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git pending
head:   7dc1d11d7abae52aada5340fb98885f0ddbb7c37
commit: be0d0ce77aa3b93c40e2f72bbcab5df883bc0cb6 [3/13] cxl/mbox: Move buil=
d of user mailbox cmd to a helper functions
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
406/202204060533.8RYu7zFU-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/cxl/core/mbox.c:223 cxl_mbox_cmd_ctor() warn: passing zero to 'PTR_=
ERR'
drivers/cxl/core/mbox.c:227 cxl_mbox_cmd_ctor() warn: unsigned 'out_size' i=
s never less than zero.

vim +/PTR_ERR +223 drivers/cxl/core/mbox.c

4faf31b43468c58 Dan Williams     2021-09-08  209  =

be0d0ce77aa3b93 Alison Schofield 2022-03-30  210  static int cxl_mbox_cmd_c=
tor(struct cxl_mbox_cmd *mbox,
be0d0ce77aa3b93 Alison Schofield 2022-03-30  211  			     struct cxl_dev_st=
ate *cxlds, u16 opcode,
be0d0ce77aa3b93 Alison Schofield 2022-03-30  212  			     size_t in_size, s=
ize_t out_size, u64 in_payload)
be0d0ce77aa3b93 Alison Schofield 2022-03-30  213  {
be0d0ce77aa3b93 Alison Schofield 2022-03-30  214  	*mbox =3D (struct cxl_mb=
ox_cmd) {
be0d0ce77aa3b93 Alison Schofield 2022-03-30  215  		.opcode =3D opcode,
be0d0ce77aa3b93 Alison Schofield 2022-03-30  216  		.size_in =3D in_size,
be0d0ce77aa3b93 Alison Schofield 2022-03-30  217  	};
be0d0ce77aa3b93 Alison Schofield 2022-03-30  218  =

be0d0ce77aa3b93 Alison Schofield 2022-03-30  219  	if (in_size) {
be0d0ce77aa3b93 Alison Schofield 2022-03-30  220  		mbox->payload_in =3D vm=
emdup_user(u64_to_user_ptr(in_payload),
be0d0ce77aa3b93 Alison Schofield 2022-03-30  221  						in_size);
be0d0ce77aa3b93 Alison Schofield 2022-03-30  222  		if (!mbox->payload_in)
be0d0ce77aa3b93 Alison Schofield 2022-03-30 @223  			return PTR_ERR(mbox->p=
ayload_in);
be0d0ce77aa3b93 Alison Schofield 2022-03-30  224  	}
be0d0ce77aa3b93 Alison Schofield 2022-03-30  225  =

be0d0ce77aa3b93 Alison Schofield 2022-03-30  226  	/* Prepare to handle a f=
ull payload for variable sized output */
be0d0ce77aa3b93 Alison Schofield 2022-03-30 @227  	if (out_size < 0)
be0d0ce77aa3b93 Alison Schofield 2022-03-30  228  		mbox->size_out =3D cxld=
s->payload_size;
be0d0ce77aa3b93 Alison Schofield 2022-03-30  229  	else
be0d0ce77aa3b93 Alison Schofield 2022-03-30  230  		mbox->size_out =3D out_=
size;
be0d0ce77aa3b93 Alison Schofield 2022-03-30  231  =

be0d0ce77aa3b93 Alison Schofield 2022-03-30  232  	if (mbox->size_out) {
be0d0ce77aa3b93 Alison Schofield 2022-03-30  233  		mbox->payload_out =3D k=
vzalloc(mbox->size_out, GFP_KERNEL);
be0d0ce77aa3b93 Alison Schofield 2022-03-30  234  		if (!mbox->payload_out)=
 {
be0d0ce77aa3b93 Alison Schofield 2022-03-30  235  			kvfree(mbox->payload_i=
n);
be0d0ce77aa3b93 Alison Schofield 2022-03-30  236  			return -ENOMEM;
be0d0ce77aa3b93 Alison Schofield 2022-03-30  237  		}
be0d0ce77aa3b93 Alison Schofield 2022-03-30  238  	}
be0d0ce77aa3b93 Alison Schofield 2022-03-30  239  	return 0;
be0d0ce77aa3b93 Alison Schofield 2022-03-30  240  }
be0d0ce77aa3b93 Alison Schofield 2022-03-30  241  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6173671480120914291==--

