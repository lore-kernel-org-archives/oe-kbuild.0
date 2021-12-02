Content-Type: multipart/mixed; boundary="===============8204969990035075371=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4 net-next 2/4] ethtool: Add ability to configure recovered clock for SyncE feature
Date: Thu, 02 Dec 2021 20:29:39 +0800
Message-ID: <202112022021.bjtxq8wO-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8204969990035075371==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211201180208.640179-3-maciej.machnikowski@intel.com>
References: <20211201180208.640179-3-maciej.machnikowski@intel.com>
TO: Maciej Machnikowski <maciej.machnikowski@intel.com>
TO: maciej.machnikowski(a)intel.com
TO: netdev(a)vger.kernel.org
TO: intel-wired-lan(a)lists.osuosl.org
TO: arkadiusz.kubalewski(a)intel.com
CC: richardcochran(a)gmail.com
CC: abyagowi(a)fb.com
CC: anthony.l.nguyen(a)intel.com
CC: davem(a)davemloft.net
CC: kuba(a)kernel.org
CC: linux-kselftest(a)vger.kernel.org

Hi Maciej,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]

url:    https://github.com/0day-ci/linux/commits/Maciej-Machnikowski/Add-et=
htool-interface-for-SyncE/20211202-021915
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git =
23ea630f86c70cbe6691f9f839e7b6742f0e9ad3
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: i386-randconfig-c001-20211202 (https://download.01.org/0day-ci/arch=
ive/20211202/202112022021.bjtxq8wO-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> net/ethtool/synce.c:156:1-3: WARNING: possible condition with no effect =
(if =3D=3D else)

vim +156 net/ethtool/synce.c

1890b45913d75d Maciej Machnikowski 2021-12-01  150  =

1890b45913d75d Maciej Machnikowski 2021-12-01  151  static int rclk_reply_s=
ize(const struct ethnl_req_info *req_base,
1890b45913d75d Maciej Machnikowski 2021-12-01  152  			   const struct ethn=
l_reply_data *reply_base)
1890b45913d75d Maciej Machnikowski 2021-12-01  153  {
1890b45913d75d Maciej Machnikowski 2021-12-01  154  	const struct rclk_requ=
est_data *request =3D RCLK_REQDATA(req_base);
1890b45913d75d Maciej Machnikowski 2021-12-01  155  =

1890b45913d75d Maciej Machnikowski 2021-12-01 @156  	if (request->out_pin.v=
alid)
1890b45913d75d Maciej Machnikowski 2021-12-01  157  		return nla_total_size=
(sizeof(u32)) +	/* ETHTOOL_A_RCLK_PIN_FLAGS */
1890b45913d75d Maciej Machnikowski 2021-12-01  158  		       nla_total_size=
(sizeof(u32));	/* ETHTOOL_A_RCLK_OUT_PIN_IDX */
1890b45913d75d Maciej Machnikowski 2021-12-01  159  	else
1890b45913d75d Maciej Machnikowski 2021-12-01  160  		return nla_total_size=
(sizeof(u32)) +	/* ETHTOOL_A_RCLK_PIN_MIN */
1890b45913d75d Maciej Machnikowski 2021-12-01  161  		       nla_total_size=
(sizeof(u32));	/* ETHTOOL_A_RCLK_PIN_MAX */
1890b45913d75d Maciej Machnikowski 2021-12-01  162  }
1890b45913d75d Maciej Machnikowski 2021-12-01  163  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8204969990035075371==--

