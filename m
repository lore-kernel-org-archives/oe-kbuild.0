Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAB519B
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Mar 2023 11:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678100882; x=1709636882;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EEOOsdlorvhZjE0/Awyi+WeO2NIwZFhcM0f+c1+kTQE=;
  b=JZ5M/LW/cWjjn53RZrk4ku2kqy+2f0jmUaUOJWD9RjxFRjuq2+UKGAIY
   B0Iv+PslGY3lts53iSUqErz4cRgzWF7h8ei+ZTaV1TsYMO5g7GdAIrrGl
   dKVeWzhB8Hv4xyp0v/l2EE5HFw2/OzMrTL0nYNmC4tjmZCAtOks4tNxQU
   YBf1JRKdEqGEhKNfusxLtWeYvOyGDi8YvknqpFMBseI/2kDKs9QVRfm6E
   23pcbgGuMVwwOZai8fUD1nsjToX2MkjRxfo2SyHMF/+HLruzYmppAGELM
   p7TkVPOnedxJc/mcXzJwQ3/EIS0ugCQKpaa7A28Ti1njuZp0HXWUdstn6
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="363143321"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="363143321"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 03:08:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="1005353165"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="1005353165"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 06 Mar 2023 03:08:00 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZ8hD-0000Gb-1q;
	Mon, 06 Mar 2023 11:07:59 +0000
Date: Mon, 6 Mar 2023 19:07:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [sashal-stable:pending-5.15 334/429]
 drivers/phy/rockchip/phy-rockchip-typec.c:827:12-14: WARNING: Unsigned
 expression compared with zero: dp > 0
Message-ID: <202303061912.eAtjkLUu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Sasha Levin <sashal@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.15
head:   7306e5782e166a6d4168af6b32b5878186a69bd3
commit: 61b92bf5fe263c60494ed0e06e852cd397ed13e9 [334/429] phy: rockchip-typec: fix tcphy_get_mode error case
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arc-randconfig-c034-20230305 (https://download.01.org/0day-ci/archive/20230306/202303061912.eAtjkLUu-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Link: https://lore.kernel.org/r/202303061912.eAtjkLUu-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/phy/rockchip/phy-rockchip-typec.c:827:12-14: WARNING: Unsigned expression compared with zero: dp > 0
>> drivers/phy/rockchip/phy-rockchip-typec.c:824:5-8: WARNING: Unsigned expression compared with zero: ufp > 0

vim +827 drivers/phy/rockchip/phy-rockchip-typec.c

e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  805  
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  806  static int tcphy_get_mode(struct rockchip_typec_phy *tcphy)
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  807  {
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  808  	struct extcon_dev *edev = tcphy->extcon;
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  809  	union extcon_property_value property;
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  810  	unsigned int id;
5e39c6cf575f053 drivers/phy/rockchip/phy-rockchip-typec.c Shawn Lin              2017-08-03  811  	bool ufp, dp;
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  812  	u8 mode;
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  813  	int ret;
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  814  
ec1fcd7b7e6f50d drivers/phy/rockchip/phy-rockchip-typec.c Enric Balletbo i Serra 2018-03-01  815  	if (!edev)
ec1fcd7b7e6f50d drivers/phy/rockchip/phy-rockchip-typec.c Enric Balletbo i Serra 2018-03-01  816  		return MODE_DFP_USB;
ec1fcd7b7e6f50d drivers/phy/rockchip/phy-rockchip-typec.c Enric Balletbo i Serra 2018-03-01  817  
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  818  	ufp = extcon_get_state(edev, EXTCON_USB);
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  819  	dp = extcon_get_state(edev, EXTCON_DISP_DP);
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  820  
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  821  	mode = MODE_DFP_USB;
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  822  	id = EXTCON_USB_HOST;
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  823  
61b92bf5fe263c6 drivers/phy/rockchip/phy-rockchip-typec.c Neill Kapron           2023-01-26 @824  	if (ufp > 0) {
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  825  		mode = MODE_UFP_USB;
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  826  		id = EXTCON_USB;
61b92bf5fe263c6 drivers/phy/rockchip/phy-rockchip-typec.c Neill Kapron           2023-01-26 @827  	} else if (dp > 0) {
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  828  		mode = MODE_DFP_DP;
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  829  		id = EXTCON_DISP_DP;
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  830  
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  831  		ret = extcon_get_property(edev, id, EXTCON_PROP_USB_SS,
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  832  					  &property);
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  833  		if (ret) {
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  834  			dev_err(tcphy->dev, "get superspeed property failed\n");
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  835  			return ret;
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  836  		}
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  837  
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  838  		if (property.intval)
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  839  			mode |= MODE_DFP_USB;
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  840  	}
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  841  
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  842  	ret = extcon_get_property(edev, id, EXTCON_PROP_USB_TYPEC_POLARITY,
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  843  				  &property);
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  844  	if (ret) {
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  845  		dev_err(tcphy->dev, "get polarity property failed\n");
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  846  		return ret;
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  847  	}
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  848  
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  849  	tcphy->flip = property.intval ? 1 : 0;
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  850  
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  851  	return mode;
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  852  }
e96be45cb84e29e drivers/phy/phy-rockchip-typec.c          Chris Zhong            2016-08-23  853  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
