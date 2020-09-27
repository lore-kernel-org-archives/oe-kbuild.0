Content-Type: multipart/mixed; boundary="===============4629015271862421325=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/remoteproc/qcom_q6v5_mss.c:1119:21: sparse: expected void
Date: Sun, 27 Sep 2020 15:24:17 +0800
Message-ID: <202009271515.Au9ixJxC%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4629015271862421325==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Sibi Sankar <sibis@codeaurora.org>
CC: Bjorn Andersson <bjorn.andersson@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a1bffa48745afbb54cb4f873bba783b2ae8be042
commit: be050a3429f46ecf13eb2b80f299479f8bb823fb remoteproc: qcom_q6v5_mss:=
 map/unmap mpss segments before/after use
date:   5 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 5 months ago
config: arm64-randconfig-s031-20200927 (attached as .config)
compiler: aarch64-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.2-201-g24bdaac6-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dbe050a3429f46ecf13eb2b80f299479f8bb823fb
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout be050a3429f46ecf13eb2b80f299479f8bb823fb
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Darm64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   drivers/remoteproc/qcom_q6v5_mss.c:1119:21: sparse: sparse: incorrect ty=
pe in assignment (different address spaces) @@     expected void *ptr @@   =
  got void [noderef] <asn:2> * @@
>> drivers/remoteproc/qcom_q6v5_mss.c:1119:21: sparse:     expected void *p=
tr
   drivers/remoteproc/qcom_q6v5_mss.c:1119:21: sparse:     got void [nodere=
f] <asn:2> *
   drivers/remoteproc/qcom_q6v5_mss.c:1134:41: sparse: sparse: incorrect ty=
pe in argument 1 (different address spaces) @@     expected void volatile [=
noderef] <asn:2> *addr @@     got void *ptr @@
   drivers/remoteproc/qcom_q6v5_mss.c:1134:41: sparse:     expected void vo=
latile [noderef] <asn:2> *addr
>> drivers/remoteproc/qcom_q6v5_mss.c:1134:41: sparse:     got void *ptr
   drivers/remoteproc/qcom_q6v5_mss.c:1145:41: sparse: sparse: incorrect ty=
pe in argument 1 (different address spaces) @@     expected void volatile [=
noderef] <asn:2> *addr @@     got void *ptr @@
   drivers/remoteproc/qcom_q6v5_mss.c:1145:41: sparse:     expected void vo=
latile [noderef] <asn:2> *addr
   drivers/remoteproc/qcom_q6v5_mss.c:1145:41: sparse:     got void *ptr
   drivers/remoteproc/qcom_q6v5_mss.c:1158:25: sparse: sparse: incorrect ty=
pe in argument 1 (different address spaces) @@     expected void volatile [=
noderef] <asn:2> *addr @@     got void *ptr @@
   drivers/remoteproc/qcom_q6v5_mss.c:1158:25: sparse:     expected void vo=
latile [noderef] <asn:2> *addr
   drivers/remoteproc/qcom_q6v5_mss.c:1158:25: sparse:     got void *ptr
   drivers/remoteproc/qcom_q6v5_mss.c:1224:21: sparse: sparse: incorrect ty=
pe in assignment (different address spaces) @@     expected void *ptr @@   =
  got void [noderef] <asn:2> * @@
   drivers/remoteproc/qcom_q6v5_mss.c:1224:21: sparse:     expected void *p=
tr
   drivers/remoteproc/qcom_q6v5_mss.c:1224:21: sparse:     got void [nodere=
f] <asn:2> *
   drivers/remoteproc/qcom_q6v5_mss.c:1228:25: sparse: sparse: incorrect ty=
pe in argument 1 (different address spaces) @@     expected void volatile [=
noderef] <asn:2> *addr @@     got void *ptr @@
   drivers/remoteproc/qcom_q6v5_mss.c:1228:25: sparse:     expected void vo=
latile [noderef] <asn:2> *addr
   drivers/remoteproc/qcom_q6v5_mss.c:1228:25: sparse:     got void *ptr
   drivers/remoteproc/qcom_q6v5_mss.c:1542:27: sparse: sparse: incorrect ty=
pe in assignment (different address spaces) @@     expected void *mba_regio=
n @@     got void [noderef] <asn:2> * @@
   drivers/remoteproc/qcom_q6v5_mss.c:1542:27: sparse:     expected void *m=
ba_region
   drivers/remoteproc/qcom_q6v5_mss.c:1542:27: sparse:     got void [nodere=
f] <asn:2> *

vim +1119 drivers/remoteproc/qcom_q6v5_mss.c

d96f2571dc84d12 drivers/remoteproc/qcom_q6v5_mss.c Sibi Sankar            2=
020-03-05  1023  =

e7fd25226295270 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
017-01-26  1024  static int q6v5_mpss_load(struct q6v5 *qproc)
051fb70fd4ea40f drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
016-06-20  1025  {
051fb70fd4ea40f drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
016-06-20  1026  	const struct elf32_phdr *phdrs;
051fb70fd4ea40f drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
016-06-20  1027  	const struct elf32_phdr *phdr;
e7fd25226295270 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
017-01-26  1028  	const struct firmware *seg_fw;
e7fd25226295270 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
017-01-26  1029  	const struct firmware *fw;
051fb70fd4ea40f drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
016-06-20  1030  	struct elf32_hdr *ehdr;
e7fd25226295270 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
017-01-26  1031  	phys_addr_t mpss_reloc;
051fb70fd4ea40f drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
016-06-20  1032  	phys_addr_t boot_addr;
d7dc899abefb441 drivers/remoteproc/qcom_q6v5_pil.c Stefan Agner           2=
018-06-14  1033  	phys_addr_t min_addr =3D PHYS_ADDR_MAX;
e7fd25226295270 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
017-01-26  1034  	phys_addr_t max_addr =3D 0;
715d85251957ade drivers/remoteproc/qcom_q6v5_mss.c Bjorn Andersson        2=
020-03-05  1035  	u32 code_length;
e7fd25226295270 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
017-01-26  1036  	bool relocate =3D false;
a5a4e02d083d88d drivers/remoteproc/qcom_q6v5_mss.c Sibi Sankar            2=
019-01-15  1037  	char *fw_name;
a5a4e02d083d88d drivers/remoteproc/qcom_q6v5_mss.c Sibi Sankar            2=
019-01-15  1038  	size_t fw_name_len;
01625cc5e65f420 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
017-02-15  1039  	ssize_t offset;
94c907859a4c678 drivers/remoteproc/qcom_q6v5_pil.c Avaneesh Kumar Dwivedi 2=
017-10-24  1040  	size_t size =3D 0;
e7fd25226295270 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
017-01-26  1041  	void *ptr;
051fb70fd4ea40f drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
016-06-20  1042  	int ret;
051fb70fd4ea40f drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
016-06-20  1043  	int i;
051fb70fd4ea40f drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
016-06-20  1044  =

a5a4e02d083d88d drivers/remoteproc/qcom_q6v5_mss.c Sibi Sankar            2=
019-01-15  1045  	fw_name_len =3D strlen(qproc->hexagon_mdt_image);
a5a4e02d083d88d drivers/remoteproc/qcom_q6v5_mss.c Sibi Sankar            2=
019-01-15  1046  	if (fw_name_len <=3D 4)
a5a4e02d083d88d drivers/remoteproc/qcom_q6v5_mss.c Sibi Sankar            2=
019-01-15  1047  		return -EINVAL;
a5a4e02d083d88d drivers/remoteproc/qcom_q6v5_mss.c Sibi Sankar            2=
019-01-15  1048  =

a5a4e02d083d88d drivers/remoteproc/qcom_q6v5_mss.c Sibi Sankar            2=
019-01-15  1049  	fw_name =3D kstrdup(qproc->hexagon_mdt_image, GFP_KERNEL);
a5a4e02d083d88d drivers/remoteproc/qcom_q6v5_mss.c Sibi Sankar            2=
019-01-15  1050  	if (!fw_name)
a5a4e02d083d88d drivers/remoteproc/qcom_q6v5_mss.c Sibi Sankar            2=
019-01-15  1051  		return -ENOMEM;
a5a4e02d083d88d drivers/remoteproc/qcom_q6v5_mss.c Sibi Sankar            2=
019-01-15  1052  =

a5a4e02d083d88d drivers/remoteproc/qcom_q6v5_mss.c Sibi Sankar            2=
019-01-15  1053  	ret =3D request_firmware(&fw, fw_name, qproc->dev);
e7fd25226295270 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
017-01-26  1054  	if (ret < 0) {
a5a4e02d083d88d drivers/remoteproc/qcom_q6v5_mss.c Sibi Sankar            2=
019-01-15  1055  		dev_err(qproc->dev, "unable to load %s\n", fw_name);
a5a4e02d083d88d drivers/remoteproc/qcom_q6v5_mss.c Sibi Sankar            2=
019-01-15  1056  		goto out;
051fb70fd4ea40f drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
016-06-20  1057  	}
051fb70fd4ea40f drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
016-06-20  1058  =

e7fd25226295270 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
017-01-26  1059  	/* Initialize the RMB validator */
e7fd25226295270 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
017-01-26  1060  	writel(0, qproc->rmb_base + RMB_PMI_CODE_LENGTH_REG);
e7fd25226295270 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
017-01-26  1061  =

e7fd25226295270 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
017-01-26  1062  	ret =3D q6v5_mpss_init_image(qproc, fw);
e7fd25226295270 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
017-01-26  1063  	if (ret)
e7fd25226295270 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
017-01-26  1064  		goto release_firmware;
051fb70fd4ea40f drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
016-06-20  1065  =

051fb70fd4ea40f drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
016-06-20  1066  	ehdr =3D (struct elf32_hdr *)fw->data;
051fb70fd4ea40f drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
016-06-20  1067  	phdrs =3D (struct elf32_phdr *)(ehdr + 1);
e7fd25226295270 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
017-01-26  1068  =

e7fd25226295270 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
017-01-26  1069  	for (i =3D 0; i < ehdr->e_phnum; i++) {
051fb70fd4ea40f drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
016-06-20  1070  		phdr =3D &phdrs[i];
051fb70fd4ea40f drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
016-06-20  1071  =

e7fd25226295270 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
017-01-26  1072  		if (!q6v5_phdr_valid(phdr))
051fb70fd4ea40f drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
016-06-20  1073  			continue;
051fb70fd4ea40f drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
016-06-20  1074  =

e7fd25226295270 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
017-01-26  1075  		if (phdr->p_flags & QCOM_MDT_RELOCATABLE)
e7fd25226295270 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
017-01-26  1076  			relocate =3D true;
051fb70fd4ea40f drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
016-06-20  1077  =

e7fd25226295270 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
017-01-26  1078  		if (phdr->p_paddr < min_addr)
e7fd25226295270 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
017-01-26  1079  			min_addr =3D phdr->p_paddr;
e7fd25226295270 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
017-01-26  1080  =

e7fd25226295270 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
017-01-26  1081  		if (phdr->p_paddr + phdr->p_memsz > max_addr)
e7fd25226295270 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
017-01-26  1082  			max_addr =3D ALIGN(phdr->p_paddr + phdr->p_memsz, SZ_4K=
);
e7fd25226295270 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
017-01-26  1083  	}
e7fd25226295270 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
017-01-26  1084  =

900fc60df22748d drivers/remoteproc/qcom_q6v5_mss.c Bjorn Andersson        2=
020-03-05  1085  	/**
900fc60df22748d drivers/remoteproc/qcom_q6v5_mss.c Bjorn Andersson        2=
020-03-05  1086  	 * In case of a modem subsystem restart on secure devices=
, the modem
900fc60df22748d drivers/remoteproc/qcom_q6v5_mss.c Bjorn Andersson        2=
020-03-05  1087  	 * memory can be reclaimed only after MBA is loaded. For =
modem cold
900fc60df22748d drivers/remoteproc/qcom_q6v5_mss.c Bjorn Andersson        2=
020-03-05  1088  	 * boot this will be a nop
900fc60df22748d drivers/remoteproc/qcom_q6v5_mss.c Bjorn Andersson        2=
020-03-05  1089  	 */
715d85251957ade drivers/remoteproc/qcom_q6v5_mss.c Bjorn Andersson        2=
020-03-05  1090  	q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm, true, f=
alse,
900fc60df22748d drivers/remoteproc/qcom_q6v5_mss.c Bjorn Andersson        2=
020-03-05  1091  				qproc->mpss_phys, qproc->mpss_size);
900fc60df22748d drivers/remoteproc/qcom_q6v5_mss.c Bjorn Andersson        2=
020-03-05  1092  =

715d85251957ade drivers/remoteproc/qcom_q6v5_mss.c Bjorn Andersson        2=
020-03-05  1093  	/* Share ownership between Linux and MSS, during segment =
loading */
715d85251957ade drivers/remoteproc/qcom_q6v5_mss.c Bjorn Andersson        2=
020-03-05  1094  	ret =3D q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm,=
 true, true,
715d85251957ade drivers/remoteproc/qcom_q6v5_mss.c Bjorn Andersson        2=
020-03-05  1095  				      qproc->mpss_phys, qproc->mpss_size);
715d85251957ade drivers/remoteproc/qcom_q6v5_mss.c Bjorn Andersson        2=
020-03-05  1096  	if (ret) {
715d85251957ade drivers/remoteproc/qcom_q6v5_mss.c Bjorn Andersson        2=
020-03-05  1097  		dev_err(qproc->dev,
715d85251957ade drivers/remoteproc/qcom_q6v5_mss.c Bjorn Andersson        2=
020-03-05  1098  			"assigning Q6 access to mpss memory failed: %d\n", ret);
715d85251957ade drivers/remoteproc/qcom_q6v5_mss.c Bjorn Andersson        2=
020-03-05  1099  		ret =3D -EAGAIN;
715d85251957ade drivers/remoteproc/qcom_q6v5_mss.c Bjorn Andersson        2=
020-03-05  1100  		goto release_firmware;
715d85251957ade drivers/remoteproc/qcom_q6v5_mss.c Bjorn Andersson        2=
020-03-05  1101  	}
715d85251957ade drivers/remoteproc/qcom_q6v5_mss.c Bjorn Andersson        2=
020-03-05  1102  =

e7fd25226295270 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
017-01-26  1103  	mpss_reloc =3D relocate ? min_addr : qproc->mpss_phys;
3bf62eb77c79188 drivers/remoteproc/qcom_q6v5_mss.c Sibi Sankar            2=
018-07-27  1104  	qproc->mpss_reloc =3D mpss_reloc;
94c907859a4c678 drivers/remoteproc/qcom_q6v5_pil.c Avaneesh Kumar Dwivedi 2=
017-10-24  1105  	/* Load firmware segments */
e7fd25226295270 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
017-01-26  1106  	for (i =3D 0; i < ehdr->e_phnum; i++) {
e7fd25226295270 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
017-01-26  1107  		phdr =3D &phdrs[i];
e7fd25226295270 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
017-01-26  1108  =

e7fd25226295270 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
017-01-26  1109  		if (!q6v5_phdr_valid(phdr))
051fb70fd4ea40f drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
016-06-20  1110  			continue;
051fb70fd4ea40f drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
016-06-20  1111  =

e7fd25226295270 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
017-01-26  1112  		offset =3D phdr->p_paddr - mpss_reloc;
e7fd25226295270 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
017-01-26  1113  		if (offset < 0 || offset + phdr->p_memsz > qproc->mpss_s=
ize) {
e7fd25226295270 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
017-01-26  1114  			dev_err(qproc->dev, "segment outside memory range\n");
e7fd25226295270 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
017-01-26  1115  			ret =3D -EINVAL;
e7fd25226295270 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
017-01-26  1116  			goto release_firmware;
e7fd25226295270 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
017-01-26  1117  		}
e7fd25226295270 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
017-01-26  1118  =

be050a3429f46ec drivers/remoteproc/qcom_q6v5_mss.c Sibi Sankar            2=
020-04-15 @1119  		ptr =3D ioremap_wc(qproc->mpss_phys + offset, phdr->p_me=
msz);
be050a3429f46ec drivers/remoteproc/qcom_q6v5_mss.c Sibi Sankar            2=
020-04-15  1120  		if (!ptr) {
be050a3429f46ec drivers/remoteproc/qcom_q6v5_mss.c Sibi Sankar            2=
020-04-15  1121  			dev_err(qproc->dev,
be050a3429f46ec drivers/remoteproc/qcom_q6v5_mss.c Sibi Sankar            2=
020-04-15  1122  				"unable to map memory region: %pa+%zx-%x\n",
be050a3429f46ec drivers/remoteproc/qcom_q6v5_mss.c Sibi Sankar            2=
020-04-15  1123  				&qproc->mpss_phys, offset, phdr->p_memsz);
be050a3429f46ec drivers/remoteproc/qcom_q6v5_mss.c Sibi Sankar            2=
020-04-15  1124  			goto release_firmware;
be050a3429f46ec drivers/remoteproc/qcom_q6v5_mss.c Sibi Sankar            2=
020-04-15  1125  		}
e7fd25226295270 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
017-01-26  1126  =

f04b913834569ef drivers/remoteproc/qcom_q6v5_mss.c Bjorn Andersson        2=
019-06-21  1127  		if (phdr->p_filesz && phdr->p_offset < fw->size) {
f04b913834569ef drivers/remoteproc/qcom_q6v5_mss.c Bjorn Andersson        2=
019-06-21  1128  			/* Firmware is large enough to be non-split */
f04b913834569ef drivers/remoteproc/qcom_q6v5_mss.c Bjorn Andersson        2=
019-06-21  1129  			if (phdr->p_offset + phdr->p_filesz > fw->size) {
f04b913834569ef drivers/remoteproc/qcom_q6v5_mss.c Bjorn Andersson        2=
019-06-21  1130  				dev_err(qproc->dev,
f04b913834569ef drivers/remoteproc/qcom_q6v5_mss.c Bjorn Andersson        2=
019-06-21  1131  					"failed to load segment %d from truncated file %s\n",
f04b913834569ef drivers/remoteproc/qcom_q6v5_mss.c Bjorn Andersson        2=
019-06-21  1132  					i, fw_name);
f04b913834569ef drivers/remoteproc/qcom_q6v5_mss.c Bjorn Andersson        2=
019-06-21  1133  				ret =3D -EINVAL;
be050a3429f46ec drivers/remoteproc/qcom_q6v5_mss.c Sibi Sankar            2=
020-04-15 @1134  				iounmap(ptr);
f04b913834569ef drivers/remoteproc/qcom_q6v5_mss.c Bjorn Andersson        2=
019-06-21  1135  				goto release_firmware;
f04b913834569ef drivers/remoteproc/qcom_q6v5_mss.c Bjorn Andersson        2=
019-06-21  1136  			}
f04b913834569ef drivers/remoteproc/qcom_q6v5_mss.c Bjorn Andersson        2=
019-06-21  1137  =

f04b913834569ef drivers/remoteproc/qcom_q6v5_mss.c Bjorn Andersson        2=
019-06-21  1138  			memcpy(ptr, fw->data + phdr->p_offset, phdr->p_filesz);
f04b913834569ef drivers/remoteproc/qcom_q6v5_mss.c Bjorn Andersson        2=
019-06-21  1139  		} else if (phdr->p_filesz) {
a5a4e02d083d88d drivers/remoteproc/qcom_q6v5_mss.c Sibi Sankar            2=
019-01-15  1140  			/* Replace "xxx.xxx" with "xxx.bxx" */
a5a4e02d083d88d drivers/remoteproc/qcom_q6v5_mss.c Sibi Sankar            2=
019-01-15  1141  			sprintf(fw_name + fw_name_len - 3, "b%02d", i);
a5a4e02d083d88d drivers/remoteproc/qcom_q6v5_mss.c Sibi Sankar            2=
019-01-15  1142  			ret =3D request_firmware(&seg_fw, fw_name, qproc->dev);
e7fd25226295270 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
017-01-26  1143  			if (ret) {
a5a4e02d083d88d drivers/remoteproc/qcom_q6v5_mss.c Sibi Sankar            2=
019-01-15  1144  				dev_err(qproc->dev, "failed to load %s\n", fw_name);
be050a3429f46ec drivers/remoteproc/qcom_q6v5_mss.c Sibi Sankar            2=
020-04-15  1145  				iounmap(ptr);
e7fd25226295270 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
017-01-26  1146  				goto release_firmware;
e7fd25226295270 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
017-01-26  1147  			}
e7fd25226295270 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
017-01-26  1148  =

e7fd25226295270 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
017-01-26  1149  			memcpy(ptr, seg_fw->data, seg_fw->size);
e7fd25226295270 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
017-01-26  1150  =

e7fd25226295270 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
017-01-26  1151  			release_firmware(seg_fw);
e7fd25226295270 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
017-01-26  1152  		}
e7fd25226295270 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
017-01-26  1153  =

e7fd25226295270 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
017-01-26  1154  		if (phdr->p_memsz > phdr->p_filesz) {
e7fd25226295270 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
017-01-26  1155  			memset(ptr + phdr->p_filesz, 0,
e7fd25226295270 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
017-01-26  1156  			       phdr->p_memsz - phdr->p_filesz);
e7fd25226295270 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
017-01-26  1157  		}
be050a3429f46ec drivers/remoteproc/qcom_q6v5_mss.c Sibi Sankar            2=
020-04-15  1158  		iounmap(ptr);
94c907859a4c678 drivers/remoteproc/qcom_q6v5_pil.c Avaneesh Kumar Dwivedi 2=
017-10-24  1159  		size +=3D phdr->p_memsz;
715d85251957ade drivers/remoteproc/qcom_q6v5_mss.c Bjorn Andersson        2=
020-03-05  1160  =

715d85251957ade drivers/remoteproc/qcom_q6v5_mss.c Bjorn Andersson        2=
020-03-05  1161  		code_length =3D readl(qproc->rmb_base + RMB_PMI_CODE_LEN=
GTH_REG);
715d85251957ade drivers/remoteproc/qcom_q6v5_mss.c Bjorn Andersson        2=
020-03-05  1162  		if (!code_length) {
715d85251957ade drivers/remoteproc/qcom_q6v5_mss.c Bjorn Andersson        2=
020-03-05  1163  			boot_addr =3D relocate ? qproc->mpss_phys : min_addr;
715d85251957ade drivers/remoteproc/qcom_q6v5_mss.c Bjorn Andersson        2=
020-03-05  1164  			writel(boot_addr, qproc->rmb_base + RMB_PMI_CODE_START_=
REG);
715d85251957ade drivers/remoteproc/qcom_q6v5_mss.c Bjorn Andersson        2=
020-03-05  1165  			writel(RMB_CMD_LOAD_READY, qproc->rmb_base + RMB_MBA_CO=
MMAND_REG);
715d85251957ade drivers/remoteproc/qcom_q6v5_mss.c Bjorn Andersson        2=
020-03-05  1166  		}
715d85251957ade drivers/remoteproc/qcom_q6v5_mss.c Bjorn Andersson        2=
020-03-05  1167  		writel(size, qproc->rmb_base + RMB_PMI_CODE_LENGTH_REG);
715d85251957ade drivers/remoteproc/qcom_q6v5_mss.c Bjorn Andersson        2=
020-03-05  1168  =

715d85251957ade drivers/remoteproc/qcom_q6v5_mss.c Bjorn Andersson        2=
020-03-05  1169  		ret =3D readl(qproc->rmb_base + RMB_MBA_STATUS_REG);
715d85251957ade drivers/remoteproc/qcom_q6v5_mss.c Bjorn Andersson        2=
020-03-05  1170  		if (ret < 0) {
715d85251957ade drivers/remoteproc/qcom_q6v5_mss.c Bjorn Andersson        2=
020-03-05  1171  			dev_err(qproc->dev, "MPSS authentication failed: %d\n",
715d85251957ade drivers/remoteproc/qcom_q6v5_mss.c Bjorn Andersson        2=
020-03-05  1172  				ret);
715d85251957ade drivers/remoteproc/qcom_q6v5_mss.c Bjorn Andersson        2=
020-03-05  1173  			goto release_firmware;
715d85251957ade drivers/remoteproc/qcom_q6v5_mss.c Bjorn Andersson        2=
020-03-05  1174  		}
94c907859a4c678 drivers/remoteproc/qcom_q6v5_pil.c Avaneesh Kumar Dwivedi 2=
017-10-24  1175  	}
e7fd25226295270 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
017-01-26  1176  =

6c5a9dc2481b481 drivers/remoteproc/qcom_q6v5_pil.c Avaneesh Kumar Dwivedi 2=
017-10-24  1177  	/* Transfer ownership of modem ddr region to q6 */
715d85251957ade drivers/remoteproc/qcom_q6v5_mss.c Bjorn Andersson        2=
020-03-05  1178  	ret =3D q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm,=
 false, true,
6c5a9dc2481b481 drivers/remoteproc/qcom_q6v5_pil.c Avaneesh Kumar Dwivedi 2=
017-10-24  1179  				      qproc->mpss_phys, qproc->mpss_size);
9f2a4342a8bf24c drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
017-11-06  1180  	if (ret) {
9f2a4342a8bf24c drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
017-11-06  1181  		dev_err(qproc->dev,
9f2a4342a8bf24c drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
017-11-06  1182  			"assigning Q6 access to mpss memory failed: %d\n", ret);
1a5d5c592e90219 drivers/remoteproc/qcom_q6v5_pil.c Christophe JAILLET     2=
017-11-15  1183  		ret =3D -EAGAIN;
1a5d5c592e90219 drivers/remoteproc/qcom_q6v5_pil.c Christophe JAILLET     2=
017-11-15  1184  		goto release_firmware;
9f2a4342a8bf24c drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
017-11-06  1185  	}
6c5a9dc2481b481 drivers/remoteproc/qcom_q6v5_pil.c Avaneesh Kumar Dwivedi 2=
017-10-24  1186  =

72beb4907046314 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
016-07-12  1187  	ret =3D q6v5_rmb_mba_wait(qproc, RMB_MBA_AUTH_COMPLETE, 1=
0000);
72beb4907046314 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
016-07-12  1188  	if (ret =3D=3D -ETIMEDOUT)
72beb4907046314 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
016-07-12  1189  		dev_err(qproc->dev, "MPSS authentication timed out\n");
72beb4907046314 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
016-07-12  1190  	else if (ret < 0)
72beb4907046314 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
016-07-12  1191  		dev_err(qproc->dev, "MPSS authentication failed: %d\n", =
ret);
72beb4907046314 drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
016-07-12  1192  =

051fb70fd4ea40f drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
016-06-20  1193  release_firmware:
051fb70fd4ea40f drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
016-06-20  1194  	release_firmware(fw);
a5a4e02d083d88d drivers/remoteproc/qcom_q6v5_mss.c Sibi Sankar            2=
019-01-15  1195  out:
a5a4e02d083d88d drivers/remoteproc/qcom_q6v5_mss.c Sibi Sankar            2=
019-01-15  1196  	kfree(fw_name);
051fb70fd4ea40f drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
016-06-20  1197  =

051fb70fd4ea40f drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
016-06-20  1198  	return ret < 0 ? ret : 0;
051fb70fd4ea40f drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
016-06-20  1199  }
051fb70fd4ea40f drivers/remoteproc/qcom_q6v5_pil.c Bjorn Andersson        2=
016-06-20  1200  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--===============4629015271862421325==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
WzbCggIA
--===============4629015271862421325==--

