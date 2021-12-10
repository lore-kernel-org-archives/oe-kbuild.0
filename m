Content-Type: multipart/mixed; boundary="===============0157204810973182668=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/qcom/qdsp6/audioreach.c:212 __audioreach_alloc_pkt() warn: is 'p' large enough for 'struct gpr_pkt'? s32min
Date: Fri, 10 Dec 2021 21:17:05 +0800
Message-ID: <202112102127.p5MeK8y5-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0157204810973182668==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
CC: Mark Brown <broonie@kernel.org>
CC: "Pierre-Louis Bossart" <pierre-louis.bossart@linux.intel.com>

Hi Srinivas,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c741e49150dbb0c0aebe234389f4aa8b47958fa8
commit: cf989b68fcadbeeea1446e50fd8b2f24a0f1275c ASoC: qdsp6: audioreach: a=
dd Kconfig and Makefile
date:   6 weeks ago
:::::: branch date: 16 hours ago
:::::: commit date: 6 weeks ago
config: riscv-randconfig-m031-20211210 (https://download.01.org/0day-ci/arc=
hive/20211210/202112102127.p5MeK8y5-lkp(a)intel.com/config)
compiler: riscv64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
sound/soc/qcom/qdsp6/audioreach.c:212 __audioreach_alloc_pkt() warn: is 'p'=
 large enough for 'struct gpr_pkt'? s32min
sound/soc/qcom/qdsp6/audioreach.c:228 __audioreach_alloc_pkt() warn: is 'p'=
 large enough for 'struct apm_cmd_header'? 0

vim +212 sound/soc/qcom/qdsp6/audioreach.c

44c28dbdb6195b Srinivas Kandagatla 2021-10-26  196  =

44c28dbdb6195b Srinivas Kandagatla 2021-10-26  197  static void *__audiorea=
ch_alloc_pkt(int payload_size, uint32_t opcode, uint32_t token,
44c28dbdb6195b Srinivas Kandagatla 2021-10-26  198  				    uint32_t src_po=
rt, uint32_t dest_port, bool has_cmd_hdr)
44c28dbdb6195b Srinivas Kandagatla 2021-10-26  199  {
44c28dbdb6195b Srinivas Kandagatla 2021-10-26  200  	struct gpr_pkt *pkt;
44c28dbdb6195b Srinivas Kandagatla 2021-10-26  201  	void *p;
44c28dbdb6195b Srinivas Kandagatla 2021-10-26  202  	int pkt_size =3D GPR_H=
DR_SIZE + payload_size;
44c28dbdb6195b Srinivas Kandagatla 2021-10-26  203  =

44c28dbdb6195b Srinivas Kandagatla 2021-10-26  204  	if (has_cmd_hdr)
44c28dbdb6195b Srinivas Kandagatla 2021-10-26  205  		pkt_size +=3D APM_CMD=
_HDR_SIZE;
44c28dbdb6195b Srinivas Kandagatla 2021-10-26  206  =

44c28dbdb6195b Srinivas Kandagatla 2021-10-26  207  	p =3D kzalloc(pkt_size=
, GFP_KERNEL);
44c28dbdb6195b Srinivas Kandagatla 2021-10-26  208  	if (!p)
44c28dbdb6195b Srinivas Kandagatla 2021-10-26  209  		return ERR_PTR(-ENOME=
M);
44c28dbdb6195b Srinivas Kandagatla 2021-10-26  210  =

44c28dbdb6195b Srinivas Kandagatla 2021-10-26  211  	pkt =3D p;
44c28dbdb6195b Srinivas Kandagatla 2021-10-26 @212  	pkt->hdr.version =3D G=
PR_PKT_VER;
44c28dbdb6195b Srinivas Kandagatla 2021-10-26  213  	pkt->hdr.hdr_size =3D =
GPR_PKT_HEADER_WORD_SIZE;
44c28dbdb6195b Srinivas Kandagatla 2021-10-26  214  	pkt->hdr.pkt_size =3D =
pkt_size;
44c28dbdb6195b Srinivas Kandagatla 2021-10-26  215  	pkt->hdr.dest_port =3D=
 dest_port;
44c28dbdb6195b Srinivas Kandagatla 2021-10-26  216  	pkt->hdr.src_port =3D =
src_port;
44c28dbdb6195b Srinivas Kandagatla 2021-10-26  217  =

44c28dbdb6195b Srinivas Kandagatla 2021-10-26  218  	pkt->hdr.dest_domain =
=3D GPR_DOMAIN_ID_ADSP;
44c28dbdb6195b Srinivas Kandagatla 2021-10-26  219  	pkt->hdr.src_domain =
=3D GPR_DOMAIN_ID_APPS;
44c28dbdb6195b Srinivas Kandagatla 2021-10-26  220  	pkt->hdr.token =3D tok=
en;
44c28dbdb6195b Srinivas Kandagatla 2021-10-26  221  	pkt->hdr.opcode =3D op=
code;
44c28dbdb6195b Srinivas Kandagatla 2021-10-26  222  =

44c28dbdb6195b Srinivas Kandagatla 2021-10-26  223  	if (has_cmd_hdr) {
44c28dbdb6195b Srinivas Kandagatla 2021-10-26  224  		struct apm_cmd_header=
 *cmd_header;
44c28dbdb6195b Srinivas Kandagatla 2021-10-26  225  =

44c28dbdb6195b Srinivas Kandagatla 2021-10-26  226  		p =3D p + GPR_HDR_SIZ=
E;
44c28dbdb6195b Srinivas Kandagatla 2021-10-26  227  		cmd_header =3D p;
44c28dbdb6195b Srinivas Kandagatla 2021-10-26 @228  		cmd_header->payload_s=
ize =3D payload_size;
44c28dbdb6195b Srinivas Kandagatla 2021-10-26  229  	}
44c28dbdb6195b Srinivas Kandagatla 2021-10-26  230  =

44c28dbdb6195b Srinivas Kandagatla 2021-10-26  231  	return pkt;
44c28dbdb6195b Srinivas Kandagatla 2021-10-26  232  }
44c28dbdb6195b Srinivas Kandagatla 2021-10-26  233  =


:::::: The code at line 212 was first introduced by commit
:::::: 44c28dbdb6195b2a92e1fcb2946d1e987658f8b5 ASoC: qdsp6: audioreach: ad=
d basic pkt alloc support

:::::: TO: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
:::::: CC: Mark Brown <broonie@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0157204810973182668==--

