Content-Type: multipart/mixed; boundary="===============0841244149883897609=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] nvmet: add support reading with offset from ANA log
Date: Thu, 30 Dec 2021 11:09:03 +0800
Message-ID: <202112301112.j0GHPdfj-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0841244149883897609==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211229155302.16789-1-dwagner@suse.de>
References: <20211229155302.16789-1-dwagner@suse.de>
TO: Daniel Wagner <dwagner@suse.de>
TO: linux-nvme(a)lists.infradead.org
CC: linux-kernel(a)vger.kernel.org
CC: Daniel Wagner <dwagner@suse.de>

Hi Daniel,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linux/master]
[also build test WARNING on linus/master v5.16-rc7 next-20211224]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Daniel-Wagner/nvmet-add-su=
pport-reading-with-offset-from-ANA-log/20211229-235321
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
136057256686de39cc3a07c2e39ef6bc43003ff6
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: ia64-randconfig-m031-20211229 (https://download.01.org/0day-ci/arch=
ive/20211230/202112301112.j0GHPdfj-lkp(a)intel.com/config)
compiler: ia64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/nvme/target/admin-cmd.c:307 nvmet_execute_get_log_page_ana() warn: =
is 'buffer' large enough for 'struct nvme_ana_rsp_hdr'? 15

vim +307 drivers/nvme/target/admin-cmd.c

72efd25dcf4f63 Christoph Hellwig 2018-07-19  268  =

72efd25dcf4f63 Christoph Hellwig 2018-07-19  269  static void nvmet_execute=
_get_log_page_ana(struct nvmet_req *req)
72efd25dcf4f63 Christoph Hellwig 2018-07-19  270  {
d4f2899b84cf50 Daniel Wagner     2021-12-29  271  	struct nvme_ana_rsp_hdr =
*hdr;
72efd25dcf4f63 Christoph Hellwig 2018-07-19  272  	struct nvme_ana_group_de=
sc *desc;
d4f2899b84cf50 Daniel Wagner     2021-12-29  273  	u64 offset =3D nvmet_get=
_log_page_offset(req->cmd);
72efd25dcf4f63 Christoph Hellwig 2018-07-19  274  	size_t len;
d4f2899b84cf50 Daniel Wagner     2021-12-29  275  	void *buffer;
72efd25dcf4f63 Christoph Hellwig 2018-07-19  276  	u32 grpid;
72efd25dcf4f63 Christoph Hellwig 2018-07-19  277  	u16 ngrps =3D 0;
72efd25dcf4f63 Christoph Hellwig 2018-07-19  278  	u16 status;
72efd25dcf4f63 Christoph Hellwig 2018-07-19  279  =

d4f2899b84cf50 Daniel Wagner     2021-12-29  280  	if (offset & 0x3) {
d4f2899b84cf50 Daniel Wagner     2021-12-29  281  		req->error_loc =3D
d4f2899b84cf50 Daniel Wagner     2021-12-29  282  			offsetof(struct nvme_g=
et_log_page_command, lpo);
d4f2899b84cf50 Daniel Wagner     2021-12-29  283  		status =3D NVME_SC_INVA=
LID_FIELD | NVME_SC_DNR;
d4f2899b84cf50 Daniel Wagner     2021-12-29  284  		goto out;
d4f2899b84cf50 Daniel Wagner     2021-12-29  285  	}
d4f2899b84cf50 Daniel Wagner     2021-12-29  286  =

72efd25dcf4f63 Christoph Hellwig 2018-07-19  287  	status =3D NVME_SC_INTER=
NAL;
d4f2899b84cf50 Daniel Wagner     2021-12-29  288  	len =3D sizeof(*hdr) + s=
truct_size(desc, nsids, NVMET_MAX_NAMESPACES);
d4f2899b84cf50 Daniel Wagner     2021-12-29  289  	buffer =3D kzalloc(len, =
GFP_KERNEL);
d4f2899b84cf50 Daniel Wagner     2021-12-29  290  	if (!buffer)
72efd25dcf4f63 Christoph Hellwig 2018-07-19  291  		goto out;
d4f2899b84cf50 Daniel Wagner     2021-12-29  292  	hdr =3D buffer;
d4f2899b84cf50 Daniel Wagner     2021-12-29  293  	desc =3D buffer + sizeof=
(*hdr);
72efd25dcf4f63 Christoph Hellwig 2018-07-19  294  =

72efd25dcf4f63 Christoph Hellwig 2018-07-19  295  	down_read(&nvmet_ana_sem=
);
72efd25dcf4f63 Christoph Hellwig 2018-07-19  296  	for (grpid =3D 1; grpid =
<=3D NVMET_MAX_ANAGRPS; grpid++) {
72efd25dcf4f63 Christoph Hellwig 2018-07-19  297  		if (!nvmet_ana_group_en=
abled[grpid])
72efd25dcf4f63 Christoph Hellwig 2018-07-19  298  			continue;
d4f2899b84cf50 Daniel Wagner     2021-12-29  299  		nvmet_format_ana_group(=
req, grpid, desc);
72efd25dcf4f63 Christoph Hellwig 2018-07-19  300  		ngrps++;
72efd25dcf4f63 Christoph Hellwig 2018-07-19  301  	}
be1277f5eb17a2 Hannes Reinecke   2018-07-16  302  	for ( ; grpid <=3D NVMET=
_MAX_ANAGRPS; grpid++) {
be1277f5eb17a2 Hannes Reinecke   2018-07-16  303  		if (nvmet_ana_group_ena=
bled[grpid])
be1277f5eb17a2 Hannes Reinecke   2018-07-16  304  			ngrps++;
be1277f5eb17a2 Hannes Reinecke   2018-07-16  305  	}
72efd25dcf4f63 Christoph Hellwig 2018-07-19  306  =

d4f2899b84cf50 Daniel Wagner     2021-12-29 @307  	hdr->chgcnt =3D cpu_to_l=
e64(nvmet_ana_chgcnt);
d4f2899b84cf50 Daniel Wagner     2021-12-29  308  	hdr->ngrps =3D cpu_to_le=
16(ngrps);
7114ddeb40c0cc Jay Sternberg     2018-11-12  309  	nvmet_clear_aen_bit(req,=
 NVME_AEN_BIT_ANA_CHANGE);
72efd25dcf4f63 Christoph Hellwig 2018-07-19  310  	up_read(&nvmet_ana_sem);
72efd25dcf4f63 Christoph Hellwig 2018-07-19  311  =

d4f2899b84cf50 Daniel Wagner     2021-12-29  312  	status =3D nvmet_copy_to=
_sgl(req, 0, buffer + offset,
d4f2899b84cf50 Daniel Wagner     2021-12-29  313  				   nvmet_get_log_page=
_len(req->cmd));
72efd25dcf4f63 Christoph Hellwig 2018-07-19  314  =

d4f2899b84cf50 Daniel Wagner     2021-12-29  315  	kfree(buffer);
72efd25dcf4f63 Christoph Hellwig 2018-07-19  316  out:
72efd25dcf4f63 Christoph Hellwig 2018-07-19  317  	nvmet_req_complete(req, =
status);
72efd25dcf4f63 Christoph Hellwig 2018-07-19  318  }
72efd25dcf4f63 Christoph Hellwig 2018-07-19  319  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0841244149883897609==--

