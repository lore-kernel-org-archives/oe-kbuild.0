Content-Type: multipart/mixed; boundary="===============7055321024722809832=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/platform/qcom/venus/helpers.c:627 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 623)
Date: Tue, 15 Mar 2022 10:26:35 +0800
Message-ID: <202203151010.lrgnt9Tm-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7055321024722809832==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Dikshita Agarwal <dikshita@codeaurora.org>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Stanimir Varbanov <stanimir.varbanov@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   09688c0166e76ce2fb85e86b9d99be8b0084cdf9
commit: 16545aa3dee5a01f3f42aa566a051096c87f4b6f media: venus: Set buffer t=
o FW based on FW min count requirement.
date:   5 months ago
:::::: branch date: 30 hours ago
:::::: commit date: 5 months ago
config: microblaze-randconfig-m031-20220314 (https://download.01.org/0day-c=
i/archive/20220315/202203151010.lrgnt9Tm-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/media/platform/qcom/venus/helpers.c:627 venus_helper_get_bufreq() e=
rror: we previously assumed 'req' could be null (see line 623)

vim +/req +627 drivers/media/platform/qcom/venus/helpers.c

7371093f983d35 Stanimir Varbanov 2020-08-26  614  =

af2c3834c8ca7c Stanimir Varbanov 2017-06-15  615  int venus_helper_get_bufr=
eq(struct venus_inst *inst, u32 type,
af2c3834c8ca7c Stanimir Varbanov 2017-06-15  616  			    struct hfi_buffer_=
requirements *req)
af2c3834c8ca7c Stanimir Varbanov 2017-06-15  617  {
af2c3834c8ca7c Stanimir Varbanov 2017-06-15  618  	u32 ptype =3D HFI_PROPER=
TY_CONFIG_BUFFER_REQUIREMENTS;
af2c3834c8ca7c Stanimir Varbanov 2017-06-15  619  	union hfi_get_property h=
prop;
af2c3834c8ca7c Stanimir Varbanov 2017-06-15  620  	unsigned int i;
af2c3834c8ca7c Stanimir Varbanov 2017-06-15  621  	int ret;
af2c3834c8ca7c Stanimir Varbanov 2017-06-15  622  =

af2c3834c8ca7c Stanimir Varbanov 2017-06-15 @623  	if (req)
af2c3834c8ca7c Stanimir Varbanov 2017-06-15  624  		memset(req, 0, sizeof(*=
req));
af2c3834c8ca7c Stanimir Varbanov 2017-06-15  625  =

16545aa3dee5a0 Dikshita Agarwal  2021-08-10  626  	if (type =3D=3D HFI_BUFF=
ER_OUTPUT || type =3D=3D HFI_BUFFER_OUTPUT2)
16545aa3dee5a0 Dikshita Agarwal  2021-08-10 @627  		req->count_min =3D inst=
->fw_min_cnt;
16545aa3dee5a0 Dikshita Agarwal  2021-08-10  628  =

7371093f983d35 Stanimir Varbanov 2020-08-26  629  	ret =3D platform_get_buf=
req(inst, type, req);
16545aa3dee5a0 Dikshita Agarwal  2021-08-10  630  	if (!ret) {
16545aa3dee5a0 Dikshita Agarwal  2021-08-10  631  		if (type =3D=3D HFI_BUF=
FER_OUTPUT || type =3D=3D HFI_BUFFER_OUTPUT2)
16545aa3dee5a0 Dikshita Agarwal  2021-08-10  632  			inst->fw_min_cnt =3D r=
eq->count_min;
7371093f983d35 Stanimir Varbanov 2020-08-26  633  		return 0;
16545aa3dee5a0 Dikshita Agarwal  2021-08-10  634  	}
7371093f983d35 Stanimir Varbanov 2020-08-26  635  =

af2c3834c8ca7c Stanimir Varbanov 2017-06-15  636  	ret =3D hfi_session_get_=
property(inst, ptype, &hprop);
af2c3834c8ca7c Stanimir Varbanov 2017-06-15  637  	if (ret)
af2c3834c8ca7c Stanimir Varbanov 2017-06-15  638  		return ret;
af2c3834c8ca7c Stanimir Varbanov 2017-06-15  639  =

af2c3834c8ca7c Stanimir Varbanov 2017-06-15  640  	ret =3D -EINVAL;
af2c3834c8ca7c Stanimir Varbanov 2017-06-15  641  =

af2c3834c8ca7c Stanimir Varbanov 2017-06-15  642  	for (i =3D 0; i < HFI_BU=
FFER_TYPE_MAX; i++) {
af2c3834c8ca7c Stanimir Varbanov 2017-06-15  643  		if (hprop.bufreq[i].typ=
e !=3D type)
af2c3834c8ca7c Stanimir Varbanov 2017-06-15  644  			continue;
af2c3834c8ca7c Stanimir Varbanov 2017-06-15  645  =

af2c3834c8ca7c Stanimir Varbanov 2017-06-15  646  		if (req)
af2c3834c8ca7c Stanimir Varbanov 2017-06-15  647  			memcpy(req, &hprop.buf=
req[i], sizeof(*req));
af2c3834c8ca7c Stanimir Varbanov 2017-06-15  648  		ret =3D 0;
af2c3834c8ca7c Stanimir Varbanov 2017-06-15  649  		break;
af2c3834c8ca7c Stanimir Varbanov 2017-06-15  650  	}
af2c3834c8ca7c Stanimir Varbanov 2017-06-15  651  =

af2c3834c8ca7c Stanimir Varbanov 2017-06-15  652  	return ret;
af2c3834c8ca7c Stanimir Varbanov 2017-06-15  653  }
af2c3834c8ca7c Stanimir Varbanov 2017-06-15  654  EXPORT_SYMBOL_GPL(venus_h=
elper_get_bufreq);
af2c3834c8ca7c Stanimir Varbanov 2017-06-15  655  =


---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============7055321024722809832==--

