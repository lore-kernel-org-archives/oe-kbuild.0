Content-Type: multipart/mixed; boundary="===============9107243688759081111=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 5/5] arm: dts: qcom: Add initial DTS file for Samsung Galaxy S III Neo phone
Date: Sat, 27 Mar 2021 22:37:09 +0800
Message-ID: <202103272205.CmaSqnG5-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9107243688759081111==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210326145816.9758-6-bartosz.dudziak@snejp.pl>
References: <20210326145816.9758-6-bartosz.dudziak@snejp.pl>
TO: Bartosz Dudziak <bartosz.dudziak@snejp.pl>
TO: Andy Gross <agross@kernel.org>
TO: Bjorn Andersson <bjorn.andersson@linaro.org>
TO: Michael Turquette <mturquette@baylibre.com>
TO: Stephen Boyd <sboyd@kernel.org>
TO: Rob Herring <robh+dt@kernel.org>
TO: linux-clk(a)vger.kernel.org
TO: linux-arm-msm(a)vger.kernel.org
TO: linux-kernel(a)vger.kernel.org
TO: devicetree(a)vger.kernel.org
CC: Bartosz Dudziak <bartosz.dudziak@snejp.pl>

Hi Bartosz,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on robh/for-next v5.12-rc4 next-20210326]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Bartosz-Dudziak/Samsung-Ga=
laxy-S-III-Neo-Initial-DTS/20210326-230134
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-n=
ext
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
reproduce: make ARCH=3Darm dtbs_check

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/qcom-msm8226-samsung-s3ve3g.dt.yaml: /: memory: False =
schema does not allow {'device_type': ['memory'], 'reg': [[0, 0]]}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/ro=
ot-node.yaml

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============9107243688759081111==--

