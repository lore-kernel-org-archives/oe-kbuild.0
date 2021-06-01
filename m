Content-Type: multipart/mixed; boundary="===============7099930152884732615=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 1438/5886] fs/cifsd/smbacl.c:777:37: warning: Either the condition '!pntsd' is redundant or there is pointer arithmetic with NULL pointer. [nullPointerArithmeticRedundantCheck]
Date: Tue, 01 Jun 2021 18:48:13 +0800
Message-ID: <202106011801.yw0cO80n-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7099930152884732615==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Namjae Jeon <namjae.jeon@samsung.com>
CC: Steve French <stfrench@microsoft.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   3e029760e6f8ce90c122c267a039ae73b3f1f5a4
commit: 64b39f4a2fd293cf899dd8062c57ce3715dd7ee9 [1438/5886] cifsd: clean-u=
p codes using chechpatch.pl --strict
:::::: branch date: 4 days ago
:::::: commit date: 3 weeks ago
compiler: sparc64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> fs/cifsd/smbacl.c:777:37: warning: Either the condition '!pntsd' is redu=
ndant or there is pointer arithmetic with NULL pointer. [nullPointerArithme=
ticRedundantCheck]
    char *end_of_acl =3D ((char *)pntsd) + acl_len;
                                       ^
   fs/cifsd/smbacl.c:781:6: note: Assuming that condition '!pntsd' is not r=
edundant
    if (!pntsd)
        ^
   fs/cifsd/smbacl.c:777:37: note: Null pointer addition
    char *end_of_acl =3D ((char *)pntsd) + acl_len;
                                       ^

vim +777 fs/cifsd/smbacl.c

e2f34481b24db2 Namjae Jeon 2021-03-16  769  =

e2f34481b24db2 Namjae Jeon 2021-03-16  770  /* Convert CIFS ACL to POSIX fo=
rm */
e2f34481b24db2 Namjae Jeon 2021-03-16  771  int parse_sec_desc(struct smb_n=
tsd *pntsd, int acl_len,
e2f34481b24db2 Namjae Jeon 2021-03-16  772  		struct smb_fattr *fattr)
e2f34481b24db2 Namjae Jeon 2021-03-16  773  {
e2f34481b24db2 Namjae Jeon 2021-03-16  774  	int rc =3D 0;
e2f34481b24db2 Namjae Jeon 2021-03-16  775  	struct smb_sid *owner_sid_ptr,=
 *group_sid_ptr;
e2f34481b24db2 Namjae Jeon 2021-03-16  776  	struct smb_acl *dacl_ptr; /* n=
o need for SACL ptr */
e2f34481b24db2 Namjae Jeon 2021-03-16 @777  	char *end_of_acl =3D ((char *)=
pntsd) + acl_len;
e2f34481b24db2 Namjae Jeon 2021-03-16  778  	__u32 dacloffset;
548e9ad317393b Namjae Jeon 2021-03-21  779  	int pntsd_type;
e2f34481b24db2 Namjae Jeon 2021-03-16  780  =

64b39f4a2fd293 Namjae Jeon 2021-03-30  781  	if (!pntsd)
e2f34481b24db2 Namjae Jeon 2021-03-16  782  		return -EIO;
e2f34481b24db2 Namjae Jeon 2021-03-16  783  =

e2f34481b24db2 Namjae Jeon 2021-03-16  784  	owner_sid_ptr =3D (struct smb_=
sid *)((char *)pntsd +
e2f34481b24db2 Namjae Jeon 2021-03-16  785  			le32_to_cpu(pntsd->osidoffse=
t));
e2f34481b24db2 Namjae Jeon 2021-03-16  786  	group_sid_ptr =3D (struct smb_=
sid *)((char *)pntsd +
e2f34481b24db2 Namjae Jeon 2021-03-16  787  			le32_to_cpu(pntsd->gsidoffse=
t));
e2f34481b24db2 Namjae Jeon 2021-03-16  788  	dacloffset =3D le32_to_cpu(pnt=
sd->dacloffset);
e2f34481b24db2 Namjae Jeon 2021-03-16  789  	dacl_ptr =3D (struct smb_acl *=
)((char *)pntsd + dacloffset);
e2f34481b24db2 Namjae Jeon 2021-03-16  790  	ksmbd_debug(SMB,
e2f34481b24db2 Namjae Jeon 2021-03-16  791  		"revision %d type 0x%x ooffse=
t 0x%x goffset 0x%x sacloffset 0x%x dacloffset 0x%x\n",
e2f34481b24db2 Namjae Jeon 2021-03-16  792  		 pntsd->revision, pntsd->type=
, le32_to_cpu(pntsd->osidoffset),
e2f34481b24db2 Namjae Jeon 2021-03-16  793  		 le32_to_cpu(pntsd->gsidoffse=
t),
e2f34481b24db2 Namjae Jeon 2021-03-16  794  		 le32_to_cpu(pntsd->sacloffse=
t), dacloffset);
e2f34481b24db2 Namjae Jeon 2021-03-16  795  =

e2f34481b24db2 Namjae Jeon 2021-03-16  796  	pntsd_type =3D le16_to_cpu(pnt=
sd->type);
e2f34481b24db2 Namjae Jeon 2021-03-16  797  	if (!(pntsd_type & DACL_PRESEN=
T)) {
e2f34481b24db2 Namjae Jeon 2021-03-16  798  		ksmbd_debug(SMB, "DACL_PRESEN=
T in DACL type is not set\n");
e2f34481b24db2 Namjae Jeon 2021-03-16  799  		return rc;
e2f34481b24db2 Namjae Jeon 2021-03-16  800  	}
e2f34481b24db2 Namjae Jeon 2021-03-16  801  =

e2f34481b24db2 Namjae Jeon 2021-03-16  802  	pntsd->type =3D cpu_to_le16(DA=
CL_PRESENT);
e2f34481b24db2 Namjae Jeon 2021-03-16  803  =

e2f34481b24db2 Namjae Jeon 2021-03-16  804  	if (pntsd->osidoffset) {
e2f34481b24db2 Namjae Jeon 2021-03-16  805  		rc =3D parse_sid(owner_sid_pt=
r, end_of_acl);
e2f34481b24db2 Namjae Jeon 2021-03-16  806  		if (rc) {
e2f34481b24db2 Namjae Jeon 2021-03-16  807  			ksmbd_err("%s: Error %d pars=
ing Owner SID\n", __func__, rc);
e2f34481b24db2 Namjae Jeon 2021-03-16  808  			return rc;
e2f34481b24db2 Namjae Jeon 2021-03-16  809  		}
e2f34481b24db2 Namjae Jeon 2021-03-16  810  =

e2f34481b24db2 Namjae Jeon 2021-03-16  811  		rc =3D sid_to_id(owner_sid_pt=
r, SIDOWNER, fattr);
e2f34481b24db2 Namjae Jeon 2021-03-16  812  		if (rc) {
e2f34481b24db2 Namjae Jeon 2021-03-16  813  			ksmbd_err("%s: Error %d mapp=
ing Owner SID to uid\n",
e2f34481b24db2 Namjae Jeon 2021-03-16  814  					__func__, rc);
e2f34481b24db2 Namjae Jeon 2021-03-16  815  			owner_sid_ptr =3D NULL;
e2f34481b24db2 Namjae Jeon 2021-03-16  816  		}
e2f34481b24db2 Namjae Jeon 2021-03-16  817  	}
e2f34481b24db2 Namjae Jeon 2021-03-16  818  =

e2f34481b24db2 Namjae Jeon 2021-03-16  819  	if (pntsd->gsidoffset) {
e2f34481b24db2 Namjae Jeon 2021-03-16  820  		rc =3D parse_sid(group_sid_pt=
r, end_of_acl);
e2f34481b24db2 Namjae Jeon 2021-03-16  821  		if (rc) {
e2f34481b24db2 Namjae Jeon 2021-03-16  822  			ksmbd_err("%s: Error %d mapp=
ing Owner SID to gid\n",
e2f34481b24db2 Namjae Jeon 2021-03-16  823  					__func__, rc);
e2f34481b24db2 Namjae Jeon 2021-03-16  824  			return rc;
e2f34481b24db2 Namjae Jeon 2021-03-16  825  		}
e2f34481b24db2 Namjae Jeon 2021-03-16  826  		rc =3D sid_to_id(group_sid_pt=
r, SIDUNIX_GROUP, fattr);
e2f34481b24db2 Namjae Jeon 2021-03-16  827  		if (rc) {
e2f34481b24db2 Namjae Jeon 2021-03-16  828  			ksmbd_err("%s: Error %d mapp=
ing Group SID to gid\n",
e2f34481b24db2 Namjae Jeon 2021-03-16  829  					__func__, rc);
e2f34481b24db2 Namjae Jeon 2021-03-16  830  			group_sid_ptr =3D NULL;
e2f34481b24db2 Namjae Jeon 2021-03-16  831  		}
e2f34481b24db2 Namjae Jeon 2021-03-16  832  	}
e2f34481b24db2 Namjae Jeon 2021-03-16  833  =

e2f34481b24db2 Namjae Jeon 2021-03-16  834  	if ((pntsd_type &
e2f34481b24db2 Namjae Jeon 2021-03-16  835  	     (DACL_AUTO_INHERITED | DA=
CL_AUTO_INHERIT_REQ)) =3D=3D
e2f34481b24db2 Namjae Jeon 2021-03-16  836  	    (DACL_AUTO_INHERITED | DAC=
L_AUTO_INHERIT_REQ))
e2f34481b24db2 Namjae Jeon 2021-03-16  837  		pntsd->type |=3D cpu_to_le16(=
DACL_AUTO_INHERITED);
e2f34481b24db2 Namjae Jeon 2021-03-16  838  	if (pntsd_type & DACL_PROTECTE=
D)
e2f34481b24db2 Namjae Jeon 2021-03-16  839  		pntsd->type |=3D cpu_to_le16(=
DACL_PROTECTED);
e2f34481b24db2 Namjae Jeon 2021-03-16  840  =

e2f34481b24db2 Namjae Jeon 2021-03-16  841  	if (dacloffset) {
e2f34481b24db2 Namjae Jeon 2021-03-16  842  		parse_dacl(dacl_ptr, end_of_a=
cl, owner_sid_ptr, group_sid_ptr,
e2f34481b24db2 Namjae Jeon 2021-03-16  843  				fattr);
e2f34481b24db2 Namjae Jeon 2021-03-16  844  	}
e2f34481b24db2 Namjae Jeon 2021-03-16  845  =

e2f34481b24db2 Namjae Jeon 2021-03-16  846  	return 0;
e2f34481b24db2 Namjae Jeon 2021-03-16  847  }
e2f34481b24db2 Namjae Jeon 2021-03-16  848  =


:::::: The code at line 777 was first introduced by commit
:::::: e2f34481b24db2fd634b5edb0a5bd0e4d38cc6e9 cifsd: add server-side proc=
edures for SMB3

:::::: TO: Namjae Jeon <namjae.jeon@samsung.com>
:::::: CC: Steve French <stfrench@microsoft.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7099930152884732615==--

