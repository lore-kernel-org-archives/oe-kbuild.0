Content-Type: multipart/mixed; boundary="===============3395949017935235192=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: drivers/staging/vboxsf/vboxsf_wrappers.c:95 vboxsf_map_folder() error: uninitialized symbol 'status'.
Date: Thu, 14 Nov 2019 14:49:57 +0300
Message-ID: <20191114114957.GF19079@kadam.lan>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3395949017935235192==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

[Sorry, forgot to update the From header.  - dan ]

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   31f4f5b495a62c9a8b15b1c3581acd5efeb9af8c
commit: df4028658f9dd7f82fd190e9db5bd82c05f94625 staging: Add VirtualBox gu=
est shared folder (vboxsf) support

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/staging/vboxsf/super.c:393 vboxsf_parse_monolithic() warn: impossib=
le condition '(options[1] =3D=3D (255)) =3D> ((-128)-127 =3D=3D 255)'

Old smatch warnings:
drivers/staging/vboxsf/super.c:394 vboxsf_parse_monolithic() warn: impossib=
le condition '(options[2] =3D=3D (254)) =3D> ((-128)-127 =3D=3D 254)'
drivers/staging/vboxsf/super.c:395 vboxsf_parse_monolithic() warn: impossib=
le condition '(options[3] =3D=3D (253)) =3D> ((-128)-127 =3D=3D 253)'

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Ddf4028658f9dd7f82fd190e9db5bd82c05f94625
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git remote update linus
git checkout df4028658f9dd7f82fd190e9db5bd82c05f94625

drivers/staging/vboxsf/super.c
   390  static int vboxsf_parse_monolithic(struct fs_context *fc, void *dat=
a)
   391  {
   392          char *options =3D data;
   393  =

   394          if (options && options[0] =3D=3D VBSF_MOUNT_SIGNATURE_BYTE_=
0 &&
   395                         options[1] =3D=3D VBSF_MOUNT_SIGNATURE_BYTE_=
1 &&
   396                         options[2] =3D=3D VBSF_MOUNT_SIGNATURE_BYTE_=
2 &&
   397                         options[3] =3D=3D VBSF_MOUNT_SIGNATURE_BYTE_=
3) {

These conditions are impossible.

   398                  vbg_err("vboxsf: Old binary mount data not supporte=
d, remove obsolete mount.vboxsf and/or update your VBoxService.\n");
   399                  return -EINVAL;
   400          }

regards,
dan carpenter
--===============3395949017935235192==--

