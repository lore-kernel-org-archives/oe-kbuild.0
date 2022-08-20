Content-Type: multipart/mixed; boundary="===============7103948492556045731=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/crypto/qat/qat_common/qat_uclo.c:1080:11: warning: Same value in both branches of ternary operator. [duplicateValueTernary]
Date: Sat, 20 Aug 2022 16:35:57 +0800
Message-ID: <202208201649.Mlm6uQGW-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7103948492556045731==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 drivers/crypto/qat/qat_common/qat_uclo.c:1080:11: warning: Same value in b=
oth branches of ternary operator. [duplicateValueTernary]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Yoan Picchi <yoan.picchi@arm.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>

Hi Yoan,

FYI, the error/warning was bisected to this commit, please ignore it if it'=
s irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   50cd95ac46548429e5bba7ca75cc97d11a697947
commit: 9c846c5d2d4e63d75b2cb172625087cadadbe065 crypto: qat - Removes the =
x86 dependency on the QAT drivers
date:   8 weeks ago
:::::: branch date: 11 hours ago
:::::: commit date: 8 weeks ago
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 9c846c5d2d4e63d75b2cb172625087cadadbe065
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/crypto/qat/qat_common/qat_uclo.c:1080:11: warning: Same value in=
 both branches of ternary operator. [duplicateValueTernary]
             ICP_QAT_CSS_FWSK_EXPONENT_LEN(handle);
             ^
   drivers/crypto/qat/qat_common/qat_uclo.c:1382:14: warning: Same value in=
 both branches of ternary operator. [duplicateValueTernary]
    if (size > (ICP_QAT_AE_IMG_OFFSET(handle) + ICP_QAT_CSS_MAX_IMAGE_LEN))=
 {
                ^
   drivers/crypto/qat/qat_common/qat_uclo.c:1387:4: warning: Same value in =
both branches of ternary operator. [duplicateValueTernary]
      ICP_QAT_CSS_AE_SIMG_LEN(handle) + simg_offset :
      ^
   drivers/crypto/qat/qat_common/qat_uclo.c:1430:6: warning: Same value in =
both branches of ternary operator. [duplicateValueTernary]
        ICP_QAT_CSS_FWSK_PUB_LEN(handle);
        ^
   drivers/crypto/qat/qat_common/qat_uclo.c:1431:26: warning: Same value in=
 both branches of ternary operator. [duplicateValueTernary]
    virt_addr =3D virt_addr + ICP_QAT_CSS_FWSK_PUB_LEN(handle);
                            ^
   drivers/crypto/qat/qat_common/qat_uclo.c:1438:9: warning: Same value in =
both branches of ternary operator. [duplicateValueTernary]
           ICP_QAT_CSS_FWSK_EXPONENT_LEN(handle)),
           ^
   drivers/crypto/qat/qat_common/qat_uclo.c:1448:30: warning: Same value in=
 both branches of ternary operator. [duplicateValueTernary]
    auth_desc->img_len =3D size - ICP_QAT_AE_IMG_OFFSET(handle);
                                ^
   drivers/crypto/qat/qat_common/qat_uclo.c:1450:26: warning: Same value in=
 both branches of ternary operator. [duplicateValueTernary]
           (void *)(image + ICP_QAT_AE_IMG_OFFSET(handle)),
                            ^
   drivers/crypto/qat/qat_common/qat_uclo.c:1470:16: warning: Same value in=
 both branches of ternary operator. [duplicateValueTernary]
     virt_addr +=3D ICP_QAT_CSS_FWSK_PUB_LEN(handle);
                  ^
>> drivers/crypto/qat/qat_common/qat_uclo.c:448:28: warning: Parameter 'cur=
' can be declared with const [constParameter]
        char *chunk_id, void *cur)
                              ^
>> drivers/crypto/qat/qat_common/qat_uclo.c:1066:30: warning: Variable 'suo=
f_objhdr' is not assigned a value. [unassignedVariable]
    struct icp_qat_suof_objhdr *suof_objhdr;
                                ^

vim +1080 drivers/crypto/qat/qat_common/qat_uclo.c

b0272276d903d8 Pingchao Yang 2015-12-04  1059  =

9e0f74b717e418 Jack Xu       2020-11-06  1060  static void qat_uclo_map_sim=
g(struct icp_qat_fw_loader_handle *handle,
b0272276d903d8 Pingchao Yang 2015-12-04  1061  			      struct icp_qat_suof=
_img_hdr *suof_img_hdr,
b0272276d903d8 Pingchao Yang 2015-12-04  1062  			      struct icp_qat_suof=
_chunk_hdr *suof_chunk_hdr)
b0272276d903d8 Pingchao Yang 2015-12-04  1063  {
9e0f74b717e418 Jack Xu       2020-11-06  1064  	struct icp_qat_suof_handle =
*suof_handle =3D handle->sobj_handle;
b0272276d903d8 Pingchao Yang 2015-12-04  1065  	struct icp_qat_simg_ae_mode=
 *ae_mode;
b0272276d903d8 Pingchao Yang 2015-12-04 @1066  	struct icp_qat_suof_objhdr =
*suof_objhdr;
b0272276d903d8 Pingchao Yang 2015-12-04  1067  =

b0272276d903d8 Pingchao Yang 2015-12-04  1068  	suof_img_hdr->simg_buf  =3D=
 (suof_handle->suof_buf +
b0272276d903d8 Pingchao Yang 2015-12-04  1069  				   suof_chunk_hdr->offse=
t +
b0272276d903d8 Pingchao Yang 2015-12-04  1070  				   sizeof(*suof_objhdr));
b0272276d903d8 Pingchao Yang 2015-12-04  1071  	suof_img_hdr->simg_len =3D =
((struct icp_qat_suof_objhdr *)(uintptr_t)
b0272276d903d8 Pingchao Yang 2015-12-04  1072  				  (suof_handle->suof_buf=
 +
b0272276d903d8 Pingchao Yang 2015-12-04  1073  				   suof_chunk_hdr->offse=
t))->img_length;
b0272276d903d8 Pingchao Yang 2015-12-04  1074  =

b0272276d903d8 Pingchao Yang 2015-12-04  1075  	suof_img_hdr->css_header =
=3D suof_img_hdr->simg_buf;
b0272276d903d8 Pingchao Yang 2015-12-04  1076  	suof_img_hdr->css_key =3D (=
suof_img_hdr->css_header +
b0272276d903d8 Pingchao Yang 2015-12-04  1077  				 sizeof(struct icp_qat_c=
ss_hdr));
b0272276d903d8 Pingchao Yang 2015-12-04  1078  	suof_img_hdr->css_signature=
 =3D suof_img_hdr->css_key +
9e0f74b717e418 Jack Xu       2020-11-06  1079  				      ICP_QAT_CSS_FWSK_M=
ODULUS_LEN(handle) +
9e0f74b717e418 Jack Xu       2020-11-06 @1080  				      ICP_QAT_CSS_FWSK_E=
XPONENT_LEN(handle);
b0272276d903d8 Pingchao Yang 2015-12-04  1081  	suof_img_hdr->css_simg =3D =
suof_img_hdr->css_signature +
9e0f74b717e418 Jack Xu       2020-11-06  1082  				 ICP_QAT_CSS_SIGNATURE_L=
EN(handle);
b0272276d903d8 Pingchao Yang 2015-12-04  1083  =

b0272276d903d8 Pingchao Yang 2015-12-04  1084  	ae_mode =3D (struct icp_qat=
_simg_ae_mode *)(suof_img_hdr->css_simg);
b0272276d903d8 Pingchao Yang 2015-12-04  1085  	suof_img_hdr->ae_mask =3D a=
e_mode->ae_mask;
b0272276d903d8 Pingchao Yang 2015-12-04  1086  	suof_img_hdr->simg_name =3D=
 (unsigned long)&ae_mode->simg_name;
b0272276d903d8 Pingchao Yang 2015-12-04  1087  	suof_img_hdr->appmeta_data =
=3D (unsigned long)&ae_mode->appmeta_data;
b0272276d903d8 Pingchao Yang 2015-12-04  1088  	suof_img_hdr->fw_type =3D a=
e_mode->fw_type;
b0272276d903d8 Pingchao Yang 2015-12-04  1089  }
b0272276d903d8 Pingchao Yang 2015-12-04  1090  =


:::::: The code at line 1080 was first introduced by commit
:::::: 9e0f74b717e41811921e647e7a6121cc55987f41 crypto: qat - add CSS3K sup=
port

:::::: TO: Jack Xu <jack.xu@intel.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7103948492556045731==--

