Content-Type: multipart/mixed; boundary="===============8046870667471540466=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [hch-misc:nvme-scanning-cleanup 5/27] drivers/nvme/target/passthru.c:527:6: warning: Variable 'ret' is reassigned a value before the old one has been used.
Date: Fri, 25 Sep 2020 20:52:13 +0800
Message-ID: <202009252012.y4qOP0Js%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8046870667471540466==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
CC: Christoph Hellwig <hch@lst.de>
CC: Logan Gunthorpe <logang@deltatee.com>

tree:   git://git.infradead.org/users/hch/misc.git nvme-scanning-cleanup
head:   a4965fd85cd56b6aaf0b985abac93ef12bd92d61
commit: bfaeed30ac537b096f9bc812c5b6f13de005f015 [5/27] nvme: lift the file=
 open code from nvme_ctrl_get_by_path
:::::: branch date: 5 hours ago
:::::: commit date: 9 hours ago
compiler: nios2-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/nvme/target/passthru.c:527:6: warning: Variable 'ret' is reassig=
ned a value before the old one has been used. [redundantAssignment]
    ret =3D 0;
        ^
   drivers/nvme/target/passthru.c:478:0: note: Variable 'ret' is reassigned=
 a value before the old one has been used.
    int ret =3D -EINVAL;
   ^
   drivers/nvme/target/passthru.c:527:6: note: Variable 'ret' is reassigned=
 a value before the old one has been used.
    ret =3D 0;
        ^

vim +/ret +527 drivers/nvme/target/passthru.c

ba76af676cd0514 Logan Gunthorpe    2020-07-24  473  =

ba76af676cd0514 Logan Gunthorpe    2020-07-24  474  int nvmet_passthru_ctrl=
_enable(struct nvmet_subsys *subsys)
ba76af676cd0514 Logan Gunthorpe    2020-07-24  475  {
ba76af676cd0514 Logan Gunthorpe    2020-07-24  476  	struct nvme_ctrl *ctrl;
bfaeed30ac537b0 Chaitanya Kulkarni 2020-09-16  477  	struct file *file;
ba76af676cd0514 Logan Gunthorpe    2020-07-24  478  	int ret =3D -EINVAL;
ba76af676cd0514 Logan Gunthorpe    2020-07-24  479  	void *old;
ba76af676cd0514 Logan Gunthorpe    2020-07-24  480  =

ba76af676cd0514 Logan Gunthorpe    2020-07-24  481  	mutex_lock(&subsys->lo=
ck);
ba76af676cd0514 Logan Gunthorpe    2020-07-24  482  	if (!subsys->passthru_=
ctrl_path)
ba76af676cd0514 Logan Gunthorpe    2020-07-24  483  		goto out_unlock;
ba76af676cd0514 Logan Gunthorpe    2020-07-24  484  	if (subsys->passthru_c=
trl)
ba76af676cd0514 Logan Gunthorpe    2020-07-24  485  		goto out_unlock;
ba76af676cd0514 Logan Gunthorpe    2020-07-24  486  =

ba76af676cd0514 Logan Gunthorpe    2020-07-24  487  	if (subsys->nr_namespa=
ces) {
ba76af676cd0514 Logan Gunthorpe    2020-07-24  488  		pr_info("cannot enabl=
e both passthru and regular namespaces for a single subsystem");
ba76af676cd0514 Logan Gunthorpe    2020-07-24  489  		goto out_unlock;
ba76af676cd0514 Logan Gunthorpe    2020-07-24  490  	}
ba76af676cd0514 Logan Gunthorpe    2020-07-24  491  =

bfaeed30ac537b0 Chaitanya Kulkarni 2020-09-16  492  	file =3D filp_open(sub=
sys->passthru_ctrl_path, O_RDWR, 0);
bfaeed30ac537b0 Chaitanya Kulkarni 2020-09-16  493  	if (IS_ERR(file)) {
bfaeed30ac537b0 Chaitanya Kulkarni 2020-09-16  494  		ret =3D PTR_ERR(file);
bfaeed30ac537b0 Chaitanya Kulkarni 2020-09-16  495  		goto out_unlock;
bfaeed30ac537b0 Chaitanya Kulkarni 2020-09-16  496  	}
bfaeed30ac537b0 Chaitanya Kulkarni 2020-09-16  497  =

bfaeed30ac537b0 Chaitanya Kulkarni 2020-09-16  498  	ctrl =3D nvme_ctrl_fro=
m_file(file);
bfaeed30ac537b0 Chaitanya Kulkarni 2020-09-16  499  	if (!ctrl) {
ba76af676cd0514 Logan Gunthorpe    2020-07-24  500  		pr_err("failed to ope=
n nvme controller %s\n",
ba76af676cd0514 Logan Gunthorpe    2020-07-24  501  		       subsys->passth=
ru_ctrl_path);
ba76af676cd0514 Logan Gunthorpe    2020-07-24  502  =

bfaeed30ac537b0 Chaitanya Kulkarni 2020-09-16  503  		goto out_put_file;
ba76af676cd0514 Logan Gunthorpe    2020-07-24  504  	}
ba76af676cd0514 Logan Gunthorpe    2020-07-24  505  =

ba76af676cd0514 Logan Gunthorpe    2020-07-24  506  	old =3D xa_cmpxchg(&pa=
ssthru_subsystems, ctrl->cntlid, NULL,
ba76af676cd0514 Logan Gunthorpe    2020-07-24  507  			 subsys, GFP_KERNEL);
ba76af676cd0514 Logan Gunthorpe    2020-07-24  508  	if (xa_is_err(old)) {
ba76af676cd0514 Logan Gunthorpe    2020-07-24  509  		ret =3D xa_err(old);
bfaeed30ac537b0 Chaitanya Kulkarni 2020-09-16  510  		goto out_put_file;
ba76af676cd0514 Logan Gunthorpe    2020-07-24  511  	}
ba76af676cd0514 Logan Gunthorpe    2020-07-24  512  =

ba76af676cd0514 Logan Gunthorpe    2020-07-24  513  	if (old)
bfaeed30ac537b0 Chaitanya Kulkarni 2020-09-16  514  		goto out_put_file;
ba76af676cd0514 Logan Gunthorpe    2020-07-24  515  =

ba76af676cd0514 Logan Gunthorpe    2020-07-24  516  	subsys->passthru_ctrl =
=3D ctrl;
ba76af676cd0514 Logan Gunthorpe    2020-07-24  517  	subsys->ver =3D ctrl->=
vs;
ba76af676cd0514 Logan Gunthorpe    2020-07-24  518  =

ba76af676cd0514 Logan Gunthorpe    2020-07-24  519  	if (subsys->ver < NVME=
_VS(1, 2, 1)) {
ba76af676cd0514 Logan Gunthorpe    2020-07-24  520  		pr_warn("nvme control=
ler version is too old: %llu.%llu.%llu, advertising 1.2.1\n",
ba76af676cd0514 Logan Gunthorpe    2020-07-24  521  			NVME_MAJOR(subsys->v=
er), NVME_MINOR(subsys->ver),
ba76af676cd0514 Logan Gunthorpe    2020-07-24  522  			NVME_TERTIARY(subsys=
->ver));
ba76af676cd0514 Logan Gunthorpe    2020-07-24  523  		subsys->ver =3D NVME_=
VS(1, 2, 1);
ba76af676cd0514 Logan Gunthorpe    2020-07-24  524  	}
bfaeed30ac537b0 Chaitanya Kulkarni 2020-09-16  525  	nvme_get_ctrl(ctrl);
3a6b076168e20a5 Christoph Hellwig  2020-09-16  526  	__module_get(subsys->p=
assthru_ctrl->ops->module);
bfaeed30ac537b0 Chaitanya Kulkarni 2020-09-16 @527  	ret =3D 0;
ba76af676cd0514 Logan Gunthorpe    2020-07-24  528  =

bfaeed30ac537b0 Chaitanya Kulkarni 2020-09-16  529  out_put_file:
bfaeed30ac537b0 Chaitanya Kulkarni 2020-09-16  530  	filp_close(file, NULL);
ba76af676cd0514 Logan Gunthorpe    2020-07-24  531  out_unlock:
ba76af676cd0514 Logan Gunthorpe    2020-07-24  532  	mutex_unlock(&subsys->=
lock);
ba76af676cd0514 Logan Gunthorpe    2020-07-24  533  	return ret;
ba76af676cd0514 Logan Gunthorpe    2020-07-24  534  }
ba76af676cd0514 Logan Gunthorpe    2020-07-24  535  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8046870667471540466==--

