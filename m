Content-Type: multipart/mixed; boundary="===============6753657590571605182=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jarkko-tpmdd:master 3/3] drivers/char/tpm/tpm_tis_synquacer.c:42:9: warning: Unused variable: result_le16 [unusedVariable]
Date: Sun, 10 Apr 2022 03:14:38 +0800
Message-ID: <202204100345.a30jsvrU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6753657590571605182==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Johannes Holland <johannes.holland@infineon.com>
CC: Jarkko Sakkinen <jarkko@kernel.org>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.gi=
t master
head:   b6e0cdb87bf37357489de1069d55bd59f008daeb
commit: b6e0cdb87bf37357489de1069d55bd59f008daeb [3/3] tpm: Remove read16/r=
ead32/write32 calls from tpm_tis_phy_ops
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
compiler: riscv64-linux-gcc (GCC) 11.2.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout b6e0cdb87bf37357489de1069d55bd59f008daeb
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/crypto/gemini/sl3516-ce-core.c:139:2: warning: Possible null poi=
nter dereference: rdd [nullPointer]
    rdd->next_desc.bits.eofie =3D 1;
    ^
   drivers/crypto/gemini/sl3516-ce-core.c:122:32: note: Assignment 'rdd=3DN=
ULL', assigned value is 0
    struct descriptor *dd, *rdd =3D NULL;
                                  ^
   drivers/crypto/gemini/sl3516-ce-core.c:131:16: note: Assuming condition =
is false
    for (i =3D 0; i < rctx->nr_sgd; i++) {
                  ^
   drivers/crypto/gemini/sl3516-ce-core.c:139:2: note: Null pointer derefer=
ence
    rdd->next_desc.bits.eofie =3D 1;
    ^
>> drivers/char/tpm/tpm_tis_synquacer.c:42:9: warning: Unused variable: res=
ult_le16 [unusedVariable]
    __le16 result_le16;
           ^
>> drivers/char/tpm/tpm_tis_synquacer.c:43:9: warning: Unused variable: res=
ult_le32 [unusedVariable]
    __le32 result_le32;
           ^
>> drivers/char/tpm/tpm_tis_synquacer.c:44:6: warning: Unused variable: res=
ult16 [unusedVariable]
    u16 result16;
        ^
>> drivers/char/tpm/tpm_tis_synquacer.c:45:6: warning: Unused variable: res=
ult32 [unusedVariable]
    u32 result32;
        ^
   drivers/char/tpm/tpm_tis_synquacer.c:72:9: warning: Unused variable: res=
ult_le16 [unusedVariable]
    __le16 result_le16;
           ^
   drivers/char/tpm/tpm_tis_synquacer.c:73:9: warning: Unused variable: res=
ult_le32 [unusedVariable]
    __le32 result_le32;
           ^
   drivers/char/tpm/tpm_tis_synquacer.c:74:6: warning: Unused variable: res=
ult16 [unusedVariable]
    u16 result16;
        ^
   drivers/char/tpm/tpm_tis_synquacer.c:75:6: warning: Unused variable: res=
ult32 [unusedVariable]
    u32 result32;
        ^

vim +42 drivers/char/tpm/tpm_tis_synquacer.c

d5ae56a4fe5178 Masahisa Kojima  2020-07-28  36  =

d5ae56a4fe5178 Masahisa Kojima  2020-07-28  37  static int tpm_tis_synquace=
r_read_bytes(struct tpm_tis_data *data, u32 addr,
b6e0cdb87bf373 Johannes Holland 2022-03-21  38  					u16 len, u8 *result,
b6e0cdb87bf373 Johannes Holland 2022-03-21  39  					enum tpm_tis_io_mode i=
o_mode)
d5ae56a4fe5178 Masahisa Kojima  2020-07-28  40  {
d5ae56a4fe5178 Masahisa Kojima  2020-07-28  41  	struct tpm_tis_synquacer_p=
hy *phy =3D to_tpm_tis_tcg_phy(data);
b6e0cdb87bf373 Johannes Holland 2022-03-21 @42  	__le16 result_le16;
b6e0cdb87bf373 Johannes Holland 2022-03-21 @43  	__le32 result_le32;
b6e0cdb87bf373 Johannes Holland 2022-03-21 @44  	u16 result16;
b6e0cdb87bf373 Johannes Holland 2022-03-21 @45  	u32 result32;
d5ae56a4fe5178 Masahisa Kojima  2020-07-28  46  =

b6e0cdb87bf373 Johannes Holland 2022-03-21  47  	switch (io_mode) {
b6e0cdb87bf373 Johannes Holland 2022-03-21  48  	case TPM_TIS_PHYS_8:
d5ae56a4fe5178 Masahisa Kojima  2020-07-28  49  		while (len--)
d5ae56a4fe5178 Masahisa Kojima  2020-07-28  50  			*result++ =3D ioread8(ph=
y->iobase + addr);
b6e0cdb87bf373 Johannes Holland 2022-03-21  51  		break;
b6e0cdb87bf373 Johannes Holland 2022-03-21  52  	case TPM_TIS_PHYS_16:
b6e0cdb87bf373 Johannes Holland 2022-03-21  53  		result[1] =3D ioread8(phy=
->iobase + addr + 1);
b6e0cdb87bf373 Johannes Holland 2022-03-21  54  		result[0] =3D ioread8(phy=
->iobase + addr);
b6e0cdb87bf373 Johannes Holland 2022-03-21  55  		break;
b6e0cdb87bf373 Johannes Holland 2022-03-21  56  	case TPM_TIS_PHYS_32:
b6e0cdb87bf373 Johannes Holland 2022-03-21  57  		result[3] =3D ioread8(phy=
->iobase + addr + 3);
b6e0cdb87bf373 Johannes Holland 2022-03-21  58  		result[2] =3D ioread8(phy=
->iobase + addr + 2);
b6e0cdb87bf373 Johannes Holland 2022-03-21  59  		result[1] =3D ioread8(phy=
->iobase + addr + 1);
b6e0cdb87bf373 Johannes Holland 2022-03-21  60  		result[0] =3D ioread8(phy=
->iobase + addr);
b6e0cdb87bf373 Johannes Holland 2022-03-21  61  		break;
b6e0cdb87bf373 Johannes Holland 2022-03-21  62  	}
d5ae56a4fe5178 Masahisa Kojima  2020-07-28  63  =

d5ae56a4fe5178 Masahisa Kojima  2020-07-28  64  	return 0;
d5ae56a4fe5178 Masahisa Kojima  2020-07-28  65  }
d5ae56a4fe5178 Masahisa Kojima  2020-07-28  66  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6753657590571605182==--

