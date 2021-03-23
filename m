Content-Type: multipart/mixed; boundary="===============8423949751912021467=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [smfrench-smb3-kernel:pr/34 4/23] fs/cifsd/smbacl.c:784:37: warning: Either the condition 'pntsd==NULL' is redundant or there is pointer arithmetic with NULL pointer.
Date: Tue, 23 Mar 2021 23:32:55 +0800
Message-ID: <202103232322.6aVosOOT-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8423949751912021467==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Namjae Jeon <namjae.jeon@samsung.com>
CC: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
CC: Hyunchul Lee <hyc.lee@gmail.com>
CC: Steve French <stfrench@microsoft.com>

tree:   git://github.com/smfrench/smb3-kernel.git pr/34
head:   040d73b154cc4abb007ff290fd233a73089f45d0
commit: 001c10aa51b4deb76eb074442ad1eac6df042f97 [4/23] cifsd: add Kconfig =
and Makefile
:::::: branch date: 9 hours ago
:::::: commit date: 7 days ago
compiler: arceb-elf-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> fs/cifsd/smbacl.c:784:37: warning: Either the condition 'pntsd=3D=3DNULL=
' is redundant or there is pointer arithmetic with NULL pointer. [nullPoint=
erArithmeticRedundantCheck]
    char *end_of_acl =3D ((char *)pntsd) + acl_len;
                                       ^
   fs/cifsd/smbacl.c:788:12: note: Assuming that condition 'pntsd=3D=3DNULL=
' is not redundant
    if (pntsd =3D=3D NULL)
              ^
   fs/cifsd/smbacl.c:784:37: note: Null pointer addition
    char *end_of_acl =3D ((char *)pntsd) + acl_len;
                                       ^
   fs/cifsd/smbacl.c:1140:43: warning: Either the condition 'pntsd' is redu=
ndant or there is pointer arithmetic with NULL pointer. [nullPointerArithme=
ticRedundantCheck]
    pdacl =3D (struct smb_acl *)((char *)pntsd + le32_to_cpu(pntsd->dacloff=
set));
                                             ^
   fs/cifsd/smbacl.c:1137:24: note: Assuming that condition 'pntsd' is not =
redundant
    if (acl_size <=3D 0 || (pntsd && !pntsd->dacloffset))
                          ^
   fs/cifsd/smbacl.c:1140:43: note: Null pointer addition
    pdacl =3D (struct smb_acl *)((char *)pntsd + le32_to_cpu(pntsd->dacloff=
set));
                                             ^

vim +784 fs/cifsd/smbacl.c

788b6f45c1d2ee Namjae Jeon 2021-03-16  776  =

788b6f45c1d2ee Namjae Jeon 2021-03-16  777  /* Convert CIFS ACL to POSIX fo=
rm */
788b6f45c1d2ee Namjae Jeon 2021-03-16  778  int parse_sec_desc(struct smb_n=
tsd *pntsd, int acl_len,
788b6f45c1d2ee Namjae Jeon 2021-03-16  779  		struct smb_fattr *fattr)
788b6f45c1d2ee Namjae Jeon 2021-03-16  780  {
788b6f45c1d2ee Namjae Jeon 2021-03-16  781  	int rc =3D 0;
788b6f45c1d2ee Namjae Jeon 2021-03-16  782  	struct smb_sid *owner_sid_ptr,=
 *group_sid_ptr;
788b6f45c1d2ee Namjae Jeon 2021-03-16  783  	struct smb_acl *dacl_ptr; /* n=
o need for SACL ptr */
788b6f45c1d2ee Namjae Jeon 2021-03-16 @784  	char *end_of_acl =3D ((char *)=
pntsd) + acl_len;
788b6f45c1d2ee Namjae Jeon 2021-03-16  785  	__u32 dacloffset;
788b6f45c1d2ee Namjae Jeon 2021-03-16  786  	int total_ace_size =3D 0, pnts=
d_type;
788b6f45c1d2ee Namjae Jeon 2021-03-16  787  =

788b6f45c1d2ee Namjae Jeon 2021-03-16  788  	if (pntsd =3D=3D NULL)
788b6f45c1d2ee Namjae Jeon 2021-03-16  789  		return -EIO;
788b6f45c1d2ee Namjae Jeon 2021-03-16  790  =

788b6f45c1d2ee Namjae Jeon 2021-03-16  791  	owner_sid_ptr =3D (struct smb_=
sid *)((char *)pntsd +
788b6f45c1d2ee Namjae Jeon 2021-03-16  792  			le32_to_cpu(pntsd->osidoffse=
t));
788b6f45c1d2ee Namjae Jeon 2021-03-16  793  	group_sid_ptr =3D (struct smb_=
sid *)((char *)pntsd +
788b6f45c1d2ee Namjae Jeon 2021-03-16  794  			le32_to_cpu(pntsd->gsidoffse=
t));
788b6f45c1d2ee Namjae Jeon 2021-03-16  795  	dacloffset =3D le32_to_cpu(pnt=
sd->dacloffset);
788b6f45c1d2ee Namjae Jeon 2021-03-16  796  	dacl_ptr =3D (struct smb_acl *=
)((char *)pntsd + dacloffset);
788b6f45c1d2ee Namjae Jeon 2021-03-16  797  	ksmbd_debug(SMB,
788b6f45c1d2ee Namjae Jeon 2021-03-16  798  		"revision %d type 0x%x ooffse=
t 0x%x goffset 0x%x sacloffset 0x%x dacloffset 0x%x\n",
788b6f45c1d2ee Namjae Jeon 2021-03-16  799  		 pntsd->revision, pntsd->type=
, le32_to_cpu(pntsd->osidoffset),
788b6f45c1d2ee Namjae Jeon 2021-03-16  800  		 le32_to_cpu(pntsd->gsidoffse=
t),
788b6f45c1d2ee Namjae Jeon 2021-03-16  801  		 le32_to_cpu(pntsd->sacloffse=
t), dacloffset);
788b6f45c1d2ee Namjae Jeon 2021-03-16  802  =

788b6f45c1d2ee Namjae Jeon 2021-03-16  803  	if (dacloffset && dacl_ptr)
788b6f45c1d2ee Namjae Jeon 2021-03-16  804  		total_ace_size =3D
788b6f45c1d2ee Namjae Jeon 2021-03-16  805  			le16_to_cpu(dacl_ptr->size) =
- sizeof(struct smb_acl);
788b6f45c1d2ee Namjae Jeon 2021-03-16  806  =

788b6f45c1d2ee Namjae Jeon 2021-03-16  807  	pntsd_type =3D le16_to_cpu(pnt=
sd->type);
788b6f45c1d2ee Namjae Jeon 2021-03-16  808  =

788b6f45c1d2ee Namjae Jeon 2021-03-16  809  	if (!(pntsd_type & DACL_PRESEN=
T)) {
788b6f45c1d2ee Namjae Jeon 2021-03-16  810  		ksmbd_debug(SMB, "DACL_PRESEN=
T in DACL type is not set\n");
788b6f45c1d2ee Namjae Jeon 2021-03-16  811  		return rc;
788b6f45c1d2ee Namjae Jeon 2021-03-16  812  	}
788b6f45c1d2ee Namjae Jeon 2021-03-16  813  =

788b6f45c1d2ee Namjae Jeon 2021-03-16  814  	pntsd->type =3D cpu_to_le16(DA=
CL_PRESENT);
788b6f45c1d2ee Namjae Jeon 2021-03-16  815  =

788b6f45c1d2ee Namjae Jeon 2021-03-16  816  	if (pntsd->osidoffset) {
788b6f45c1d2ee Namjae Jeon 2021-03-16  817  		rc =3D parse_sid(owner_sid_pt=
r, end_of_acl);
788b6f45c1d2ee Namjae Jeon 2021-03-16  818  		if (rc) {
788b6f45c1d2ee Namjae Jeon 2021-03-16  819  			ksmbd_err("%s: Error %d pars=
ing Owner SID\n", __func__, rc);
788b6f45c1d2ee Namjae Jeon 2021-03-16  820  			return rc;
788b6f45c1d2ee Namjae Jeon 2021-03-16  821  		}
788b6f45c1d2ee Namjae Jeon 2021-03-16  822  =

788b6f45c1d2ee Namjae Jeon 2021-03-16  823  		rc =3D sid_to_id(owner_sid_pt=
r, SIDOWNER, fattr);
788b6f45c1d2ee Namjae Jeon 2021-03-16  824  		if (rc) {
788b6f45c1d2ee Namjae Jeon 2021-03-16  825  			ksmbd_err("%s: Error %d mapp=
ing Owner SID to uid\n",
788b6f45c1d2ee Namjae Jeon 2021-03-16  826  					__func__, rc);
788b6f45c1d2ee Namjae Jeon 2021-03-16  827  			owner_sid_ptr =3D NULL;
788b6f45c1d2ee Namjae Jeon 2021-03-16  828  		}
788b6f45c1d2ee Namjae Jeon 2021-03-16  829  	}
788b6f45c1d2ee Namjae Jeon 2021-03-16  830  =

788b6f45c1d2ee Namjae Jeon 2021-03-16  831  	if (pntsd->gsidoffset) {
788b6f45c1d2ee Namjae Jeon 2021-03-16  832  		rc =3D parse_sid(group_sid_pt=
r, end_of_acl);
788b6f45c1d2ee Namjae Jeon 2021-03-16  833  		if (rc) {
788b6f45c1d2ee Namjae Jeon 2021-03-16  834  			ksmbd_err("%s: Error %d mapp=
ing Owner SID to gid\n",
788b6f45c1d2ee Namjae Jeon 2021-03-16  835  					__func__, rc);
788b6f45c1d2ee Namjae Jeon 2021-03-16  836  			return rc;
788b6f45c1d2ee Namjae Jeon 2021-03-16  837  		}
788b6f45c1d2ee Namjae Jeon 2021-03-16  838  		rc =3D sid_to_id(group_sid_pt=
r, SIDUNIX_GROUP, fattr);
788b6f45c1d2ee Namjae Jeon 2021-03-16  839  		if (rc) {
788b6f45c1d2ee Namjae Jeon 2021-03-16  840  			ksmbd_err("%s: Error %d mapp=
ing Group SID to gid\n",
788b6f45c1d2ee Namjae Jeon 2021-03-16  841  					__func__, rc);
788b6f45c1d2ee Namjae Jeon 2021-03-16  842  			group_sid_ptr =3D NULL;
788b6f45c1d2ee Namjae Jeon 2021-03-16  843  		}
788b6f45c1d2ee Namjae Jeon 2021-03-16  844  	}
788b6f45c1d2ee Namjae Jeon 2021-03-16  845  =

788b6f45c1d2ee Namjae Jeon 2021-03-16  846  	if ((pntsd_type &
788b6f45c1d2ee Namjae Jeon 2021-03-16  847  	     (DACL_AUTO_INHERITED | DA=
CL_AUTO_INHERIT_REQ)) =3D=3D
788b6f45c1d2ee Namjae Jeon 2021-03-16  848  	    (DACL_AUTO_INHERITED | DAC=
L_AUTO_INHERIT_REQ))
788b6f45c1d2ee Namjae Jeon 2021-03-16  849  		pntsd->type |=3D cpu_to_le16(=
DACL_AUTO_INHERITED);
788b6f45c1d2ee Namjae Jeon 2021-03-16  850  	if (pntsd_type & DACL_PROTECTE=
D)
788b6f45c1d2ee Namjae Jeon 2021-03-16  851  		pntsd->type |=3D cpu_to_le16(=
DACL_PROTECTED);
788b6f45c1d2ee Namjae Jeon 2021-03-16  852  =

788b6f45c1d2ee Namjae Jeon 2021-03-16  853  	if (dacloffset) {
788b6f45c1d2ee Namjae Jeon 2021-03-16  854  		parse_dacl(dacl_ptr, end_of_a=
cl, owner_sid_ptr, group_sid_ptr,
788b6f45c1d2ee Namjae Jeon 2021-03-16  855  				fattr);
788b6f45c1d2ee Namjae Jeon 2021-03-16  856  	}
788b6f45c1d2ee Namjae Jeon 2021-03-16  857  =

788b6f45c1d2ee Namjae Jeon 2021-03-16  858  	return 0;
788b6f45c1d2ee Namjae Jeon 2021-03-16  859  }
788b6f45c1d2ee Namjae Jeon 2021-03-16  860  =


:::::: The code at line 784 was first introduced by commit
:::::: 788b6f45c1d2eef909c296d775196bc6ec7dd63a cifsd: add server-side proc=
edures for SMB3

:::::: TO: Namjae Jeon <namjae.jeon@samsung.com>
:::::: CC: Namjae Jeon <namjae.jeon@samsung.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8423949751912021467==--

