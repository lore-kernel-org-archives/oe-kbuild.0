Content-Type: multipart/mixed; boundary="===============1758171640730125362=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [staging:staging-next 50/93] drivers/staging/wfx/debug.c:112 wfx_send_hif_msg_read() warn: maybe return -EFAULT instead of the bytes remaining?
Date: Tue, 08 Oct 2019 07:35:18 +0300
Message-ID: <20191008043518.GL21515@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1758171640730125362==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git =
staging-next
head:   e772cd8c9c9cd3d08715800aabaf50b771b395d9
commit: 4f8b7fabb15df3658564a98971fc67029be1815d [50/93] staging: wfx: allo=
w to send commands to chip

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/staging/wfx/debug.c:112 wfx_send_hif_msg_read() warn: maybe return =
-EFAULT instead of the bytes remaining?

# https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/commit=
/?id=3D4f8b7fabb15df3658564a98971fc67029be1815d
git remote add staging https://git.kernel.org/pub/scm/linux/kernel/git/greg=
kh/staging.git
git remote update staging
git checkout 4f8b7fabb15df3658564a98971fc67029be1815d
vim +112 drivers/staging/wfx/debug.c

4f8b7fabb15df3 J=C3=A9r=C3=B4me Pouiller 2019-09-19   95  static ssize_t wf=
x_send_hif_msg_read(struct file *file, char __user *user_buf,
4f8b7fabb15df3 J=C3=A9r=C3=B4me Pouiller 2019-09-19   96  				     size_t c=
ount, loff_t *ppos)
4f8b7fabb15df3 J=C3=A9r=C3=B4me Pouiller 2019-09-19   97  {
4f8b7fabb15df3 J=C3=A9r=C3=B4me Pouiller 2019-09-19   98  	struct dbgfs_hif=
_msg *context =3D file->private_data;
4f8b7fabb15df3 J=C3=A9r=C3=B4me Pouiller 2019-09-19   99  	int ret;
4f8b7fabb15df3 J=C3=A9r=C3=B4me Pouiller 2019-09-19  100  =

4f8b7fabb15df3 J=C3=A9r=C3=B4me Pouiller 2019-09-19  101  	if (count > size=
of(context->reply))
4f8b7fabb15df3 J=C3=A9r=C3=B4me Pouiller 2019-09-19  102  		return -EINVAL;
4f8b7fabb15df3 J=C3=A9r=C3=B4me Pouiller 2019-09-19  103  	ret =3D wait_for=
_completion_interruptible(&context->complete);
4f8b7fabb15df3 J=C3=A9r=C3=B4me Pouiller 2019-09-19  104  	if (ret)
4f8b7fabb15df3 J=C3=A9r=C3=B4me Pouiller 2019-09-19  105  		return ret;
4f8b7fabb15df3 J=C3=A9r=C3=B4me Pouiller 2019-09-19  106  	if (context->ret=
 < 0)
4f8b7fabb15df3 J=C3=A9r=C3=B4me Pouiller 2019-09-19  107  		return context-=
>ret;
4f8b7fabb15df3 J=C3=A9r=C3=B4me Pouiller 2019-09-19  108  	// Be carefull, =
write() is waiting for a full message while read()
4f8b7fabb15df3 J=C3=A9r=C3=B4me Pouiller 2019-09-19  109  	// only return a=
 payload
4f8b7fabb15df3 J=C3=A9r=C3=B4me Pouiller 2019-09-19  110  	ret =3D copy_to_=
user(user_buf, context->reply, count);
4f8b7fabb15df3 J=C3=A9r=C3=B4me Pouiller 2019-09-19  111  	if (ret)
4f8b7fabb15df3 J=C3=A9r=C3=B4me Pouiller 2019-09-19 @112  		return ret;

Yeah.  It should be:

	if (copy_to_user(user_buf, context->reply, count))
		return -EFAULT;

4f8b7fabb15df3 J=C3=A9r=C3=B4me Pouiller 2019-09-19  113  =

4f8b7fabb15df3 J=C3=A9r=C3=B4me Pouiller 2019-09-19  114  	return count;
4f8b7fabb15df3 J=C3=A9r=C3=B4me Pouiller 2019-09-19  115  }

---
0-DAY kernel test infrastructure                Open Source Technology Cent=
er
https://lists.01.org/pipermail/kbuild-all                   Intel Corporati=
on
--===============1758171640730125362==--

