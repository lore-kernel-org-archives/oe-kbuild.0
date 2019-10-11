Content-Type: multipart/mixed; boundary="===============5794614757830869495=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [ath6kl:pending-ath11k 316/345] drivers/net/wireless/ath/ath11k/debug.c:575 ath11k_write_simulate_fw_crash() error: we previously assumed 'ar' could be null (see line 549)
Date: Fri, 11 Oct 2019 13:37:19 +0300
Message-ID: <20191011103719.GR13286@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5794614757830869495==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pendi=
ng-ath11k
head:   727f4796623292eb33ce560a3e25ba0040d17871
commit: 75a016fcc8f79a7d650462c69bb28aa886b4f09e [316/345] ath11k: cleanup =
and rename ath11k_send_crash_inject_cmd()

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/wireless/ath/ath11k/debug.c:575 ath11k_write_simulate_fw_crash(=
) error: we previously assumed 'ar' could be null (see line 549)

Old smatch warnings:
drivers/net/wireless/ath/ath11k/debug.c:566 ath11k_write_simulate_fw_crash(=
) error: uninitialized symbol 'radioup'.

# https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?id=
=3D75a016fcc8f79a7d650462c69bb28aa886b4f09e
git remote add ath6kl https://git.kernel.org/pub/scm/linux/kernel/git/kvalo=
/ath.git
git remote update ath6kl
git checkout 75a016fcc8f79a7d650462c69bb28aa886b4f09e
vim +/ar +575 drivers/net/wireless/ath/ath11k/debug.c

258bbf525e652e Kalle Valo                2019-02-05  535  static ssize_t at=
h11k_write_simulate_fw_crash(struct file *file,
258bbf525e652e Kalle Valo                2019-02-05  536  					      const =
char __user *user_buf,
258bbf525e652e Kalle Valo                2019-02-05  537  					      size_t=
 count, loff_t *ppos)
258bbf525e652e Kalle Valo                2019-02-05  538  {
d25cb35c6f10ac Sathishkumar Muruganandam 2019-02-13  539  	struct ath11k_ba=
se *ab =3D file->private_data;
5cf3588467b76d Pradeep Kumar Chitrapu    2019-03-15  540  	struct ath11k_pd=
ev *pdev;
d25cb35c6f10ac Sathishkumar Muruganandam 2019-02-13  541  	struct ath11k *a=
r =3D ab->pdevs[0].ar;
258bbf525e652e Kalle Valo                2019-02-05  542  	char buf[32] =3D=
 {0};
258bbf525e652e Kalle Valo                2019-02-05  543  	ssize_t rc;
5cf3588467b76d Pradeep Kumar Chitrapu    2019-03-15  544  	int i, ret, radi=
oup;
                                                                           =
 ^^^^^^^
The real bug is that this isn't initialized.

258bbf525e652e Kalle Valo                2019-02-05  545  =

5cf3588467b76d Pradeep Kumar Chitrapu    2019-03-15  546  	for (i =3D 0; i =
< ab->num_radios; i++) {
5cf3588467b76d Pradeep Kumar Chitrapu    2019-03-15  547  		pdev =3D &ab->p=
devs[i];
5cf3588467b76d Pradeep Kumar Chitrapu    2019-03-15  548  		ar =3D pdev->ar;
5cf3588467b76d Pradeep Kumar Chitrapu    2019-03-15 @549  		if (ar && ar->s=
tate =3D=3D ATH11K_STATE_ON) {
5cf3588467b76d Pradeep Kumar Chitrapu    2019-03-15  550  			radioup =3D 1;
5cf3588467b76d Pradeep Kumar Chitrapu    2019-03-15  551  			break;
5cf3588467b76d Pradeep Kumar Chitrapu    2019-03-15  552  		}
5cf3588467b76d Pradeep Kumar Chitrapu    2019-03-15  553  	}
258bbf525e652e Kalle Valo                2019-02-05  554  	/* filter partia=
l writes and invalid commands */
258bbf525e652e Kalle Valo                2019-02-05  555  	if (*ppos !=3D 0=
 || count >=3D sizeof(buf) || count =3D=3D 0)
258bbf525e652e Kalle Valo                2019-02-05  556  		return -EINVAL;
258bbf525e652e Kalle Valo                2019-02-05  557  =

258bbf525e652e Kalle Valo                2019-02-05  558  	rc =3D simple_wr=
ite_to_buffer(buf, sizeof(buf) - 1, ppos, user_buf, count);
258bbf525e652e Kalle Valo                2019-02-05  559  	if (rc < 0)
258bbf525e652e Kalle Valo                2019-02-05  560  		return rc;
258bbf525e652e Kalle Valo                2019-02-05  561  =

258bbf525e652e Kalle Valo                2019-02-05  562  	/* drop the poss=
ible '\n' from the end */
258bbf525e652e Kalle Valo                2019-02-05  563  	if (buf[*ppos - =
1] =3D=3D '\n')
258bbf525e652e Kalle Valo                2019-02-05  564  		buf[*ppos - 1] =
=3D '\0';
258bbf525e652e Kalle Valo                2019-02-05  565  =

5cf3588467b76d Pradeep Kumar Chitrapu    2019-03-15  566  	if (radioup =3D=
=3D 0) {
                                                                    ^^^^^^^=
^^^^^
So this is meaningless.  Why not check if (i =3D=3D ab->num_radios) instead?

258bbf525e652e Kalle Valo                2019-02-05  567  		ret =3D -ENETDO=
WN;
258bbf525e652e Kalle Valo                2019-02-05  568  		goto exit;
258bbf525e652e Kalle Valo                2019-02-05  569  	}
258bbf525e652e Kalle Valo                2019-02-05  570  =

258bbf525e652e Kalle Valo                2019-02-05  571  	if (!strcmp(buf,=
 "assert")) {
d25cb35c6f10ac Sathishkumar Muruganandam 2019-02-13  572  		ath11k_info(ab,=
 "simulating firmware assert crash\n");
75a016fcc8f79a Kalle Valo                2019-08-09  573  		ret =3D ath11k_=
wmi_force_fw_hang_cmd(ar,
75a016fcc8f79a Kalle Valo                2019-08-09  574  						   ATH11K_W=
MI_FW_HANG_ASSERT_TYPE,
75a016fcc8f79a Kalle Valo                2019-08-09 @575  						   ATH11K_W=
MI_FW_HANG_DELAY);
258bbf525e652e Kalle Valo                2019-02-05  576  	} else {
258bbf525e652e Kalle Valo                2019-02-05  577  		ret =3D -EINVAL;
258bbf525e652e Kalle Valo                2019-02-05  578  		goto exit;
258bbf525e652e Kalle Valo                2019-02-05  579  	}
258bbf525e652e Kalle Valo                2019-02-05  580  =

258bbf525e652e Kalle Valo                2019-02-05  581  	if (ret) {
d25cb35c6f10ac Sathishkumar Muruganandam 2019-02-13  582  		ath11k_warn(ab,=
 "failed to simulate firmware crash: %d\n", ret);
258bbf525e652e Kalle Valo                2019-02-05  583  		goto exit;
258bbf525e652e Kalle Valo                2019-02-05  584  	}
258bbf525e652e Kalle Valo                2019-02-05  585  =

258bbf525e652e Kalle Valo                2019-02-05  586  	ret =3D count;
258bbf525e652e Kalle Valo                2019-02-05  587  =

258bbf525e652e Kalle Valo                2019-02-05  588  exit:
258bbf525e652e Kalle Valo                2019-02-05  589  	return ret;
258bbf525e652e Kalle Valo                2019-02-05  590  }

---
0-DAY kernel test infrastructure                Open Source Technology Cent=
er
https://lists.01.org/pipermail/kbuild-all                   Intel Corporati=
on
--===============5794614757830869495==--

