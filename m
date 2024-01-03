Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13271108
	for <oe-kbuild@lists.linux.dev>; Wed,  3 Jan 2024 01:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JvmOvMqg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704245799; x=1735781799;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=aDV7jMbShTp2lJUBZIbQtYfdHIWS2Di2sO5kr68FwCI=;
  b=JvmOvMqgEUL4ydrAjbmzSn9wHSocWCEb14WkdXanTTm/PPZjyrfg9q86
   MieVaV/WgoYJDfQu1fuls9AleOwFn+y1fFIyEGAXtdeGfdJa3wqTvqhE7
   +6cZGHw8Qxfc637TvIOVz6LpiKDCkmL0y7uTfLNdZ1zapRIjsTxFGrAJO
   LJ4FJINmOYmSv84a/10LvhLvCoJXQdZghq+rBPgOQl7iln4d8RSqpyx+u
   KB2Yib6vSFVbGAbfp5aZVw8cxa2WUpTKimsZMBSevpRNcZzH1C8AWCRS2
   anxgEQSLOKCE1S+osG2EPpGd0tCc+NcGsGnMYX7wQKrA2i243qwDPZ4aN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="3782775"
X-IronPort-AV: E=Sophos;i="6.04,326,1695711600"; 
   d="scan'208";a="3782775"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2024 17:36:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="953078467"
X-IronPort-AV: E=Sophos;i="6.04,326,1695711600"; 
   d="scan'208";a="953078467"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 02 Jan 2024 17:36:37 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rKqBN-000Lc6-3C;
	Wed, 03 Jan 2024 01:36:34 +0000
Date: Wed, 3 Jan 2024 09:35:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 1/4] wifi: brcmfmac: export firmware interface functions
Message-ID: <202401030944.GxNYBoIe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240101084430.161821-2-arend.vanspriel@broadcom.com>
References: <20240101084430.161821-2-arend.vanspriel@broadcom.com>
TO: Arend van Spriel <arend.vanspriel@broadcom.com>
TO: Kalle Valo <kvalo@kernel.org>
CC: linux-wireless@vger.kernel.org
CC: Arend van Spriel <arend.vanspriel@broadcom.com>

Hi Arend,

kernel test robot noticed the following build warnings:

[auto build test WARNING on wireless-next/main]
[also build test WARNING on wireless/main linus/master v6.7-rc8 next-20240102]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arend-van-Spriel/wifi-brcmfmac-export-firmware-interface-functions/20240101-164717
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20240101084430.161821-2-arend.vanspriel%40broadcom.com
patch subject: [PATCH 1/4] wifi: brcmfmac: export firmware interface functions
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20240102 (https://download.01.org/0day-ci/archive/20240103/202401030944.GxNYBoIe-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202401030944.GxNYBoIe-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:5587 brcmf_cfg80211_mgmt_tx() error: uninitialized symbol 'freq'.
drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c:610 brcmf_netdev_open() error: uninitialized symbol 'toe_ol'.

Old smatch warnings:
drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c:1115 brcmf_inet6addr_changed() error: buffer overflow 'table' 8 <= 8

vim +/freq +5587 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c

0de8aace0ff499 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5501  
0de8aace0ff499 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5502  
0de8aace0ff499 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5503  static int
0de8aace0ff499 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5504  brcmf_cfg80211_mgmt_tx(struct wiphy *wiphy, struct wireless_dev *wdev,
b176e629402f41 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Andrei Otcheretianski 2013-11-18  5505  		       struct cfg80211_mgmt_tx_params *params, u64 *cookie)
0de8aace0ff499 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5506  {
0de8aace0ff499 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5507  	struct brcmf_cfg80211_info *cfg = wiphy_to_cfg(wiphy);
b176e629402f41 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Andrei Otcheretianski 2013-11-18  5508  	struct ieee80211_channel *chan = params->chan;
16e64676839633 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Rafał Miłecki         2019-02-15  5509  	struct brcmf_pub *drvr = cfg->pub;
b176e629402f41 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Andrei Otcheretianski 2013-11-18  5510  	const u8 *buf = params->buf;
b176e629402f41 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Andrei Otcheretianski 2013-11-18  5511  	size_t len = params->len;
0de8aace0ff499 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5512  	const struct ieee80211_mgmt *mgmt;
0de8aace0ff499 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5513  	struct brcmf_cfg80211_vif *vif;
0de8aace0ff499 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5514  	s32 err = 0;
0de8aace0ff499 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5515  	s32 ie_offset;
0de8aace0ff499 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5516  	s32 ie_len;
18e2f61db3b708 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5517  	struct brcmf_fil_action_frame_le *action_frame;
18e2f61db3b708 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5518  	struct brcmf_fil_af_params_le *af_params;
18e2f61db3b708 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5519  	bool ack;
18e2f61db3b708 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5520  	s32 chan_nr;
c2ff8cad64233b drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Antonio Quartulli     2013-06-11  5521  	u32 freq;
0de8aace0ff499 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5522  
0de8aace0ff499 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5523  	brcmf_dbg(TRACE, "Enter\n");
0de8aace0ff499 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5524  
0de8aace0ff499 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5525  	*cookie = 0;
0de8aace0ff499 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5526  
0de8aace0ff499 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5527  	mgmt = (const struct ieee80211_mgmt *)buf;
0de8aace0ff499 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5528  
a0f07959ee6e7f drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5529  	if (!ieee80211_is_mgmt(mgmt->frame_control)) {
16e64676839633 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Rafał Miłecki         2019-02-15  5530  		bphy_err(drvr, "Driver only allows MGMT packet type\n");
a0f07959ee6e7f drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5531  		return -EPERM;
a0f07959ee6e7f drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5532  	}
a0f07959ee6e7f drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5533  
c2ff8cad64233b drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Antonio Quartulli     2013-06-11  5534  	vif = container_of(wdev, struct brcmf_cfg80211_vif, wdev);
c2ff8cad64233b drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Antonio Quartulli     2013-06-11  5535  
0de8aace0ff499 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5536  	if (ieee80211_is_probe_resp(mgmt->frame_control)) {
0de8aace0ff499 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5537  		/* Right now the only reason to get a probe response */
a0f07959ee6e7f drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5538  		/* is for p2p listen response or for p2p GO from     */
a0f07959ee6e7f drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5539  		/* wpa_supplicant. Unfortunately the probe is send   */
a0f07959ee6e7f drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5540  		/* on primary ndev, while dongle wants it on the p2p */
0de8aace0ff499 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5541  		/* vif. Since this is only reason for a probe        */
0de8aace0ff499 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5542  		/* response to be sent, the vif is taken from cfg.   */
0de8aace0ff499 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5543  		/* If ever desired to send proberesp for non p2p     */
0de8aace0ff499 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5544  		/* response then data should be checked for          */
0de8aace0ff499 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5545  		/* "DIRECT-". Note in future supplicant will take    */
0de8aace0ff499 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5546  		/* dedicated p2p wdev to do this and then this 'hack'*/
0de8aace0ff499 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5547  		/* is not needed anymore.                            */
0de8aace0ff499 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5548  		ie_offset =  DOT11_MGMT_HDR_LEN +
0de8aace0ff499 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5549  			     DOT11_BCN_PRB_FIXED_LEN;
0de8aace0ff499 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5550  		ie_len = len - ie_offset;
a0f07959ee6e7f drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5551  		if (vif == cfg->p2p.bss_idx[P2PAPI_BSSCFG_PRIMARY].vif)
0de8aace0ff499 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5552  			vif = cfg->p2p.bss_idx[P2PAPI_BSSCFG_DEVICE].vif;
0de8aace0ff499 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5553  		err = brcmf_vif_set_mgmt_ie(vif,
0de8aace0ff499 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5554  					    BRCMF_VNDR_IE_PRBRSP_FLAG,
0de8aace0ff499 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5555  					    &buf[ie_offset],
0de8aace0ff499 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5556  					    ie_len);
0de8aace0ff499 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5557  		cfg80211_mgmt_tx_status(wdev, *cookie, buf, len, true,
0de8aace0ff499 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5558  					GFP_KERNEL);
18e2f61db3b708 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5559  	} else if (ieee80211_is_action(mgmt->frame_control)) {
8f44c9a4138672 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Arend van Spriel      2017-07-07  5560  		if (len > BRCMF_FIL_ACTION_FRAME_SIZE + DOT11_MGMT_HDR_LEN) {
16e64676839633 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Rafał Miłecki         2019-02-15  5561  			bphy_err(drvr, "invalid action frame length\n");
8f44c9a4138672 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Arend van Spriel      2017-07-07  5562  			err = -EINVAL;
8f44c9a4138672 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Arend van Spriel      2017-07-07  5563  			goto exit;
8f44c9a4138672 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Arend van Spriel      2017-07-07  5564  		}
18e2f61db3b708 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5565  		af_params = kzalloc(sizeof(*af_params), GFP_KERNEL);
18e2f61db3b708 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5566  		if (af_params == NULL) {
16e64676839633 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Rafał Miłecki         2019-02-15  5567  			bphy_err(drvr, "unable to allocate frame\n");
18e2f61db3b708 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5568  			err = -ENOMEM;
18e2f61db3b708 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5569  			goto exit;
18e2f61db3b708 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5570  		}
18e2f61db3b708 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5571  		action_frame = &af_params->action_frame;
18e2f61db3b708 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5572  		/* Add the packet Id */
18e2f61db3b708 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5573  		action_frame->packet_id = cpu_to_le32(*cookie);
18e2f61db3b708 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5574  		/* Add BSSID */
18e2f61db3b708 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5575  		memcpy(&action_frame->da[0], &mgmt->da[0], ETH_ALEN);
18e2f61db3b708 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5576  		memcpy(&af_params->bssid[0], &mgmt->bssid[0], ETH_ALEN);
18e2f61db3b708 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5577  		/* Add the length exepted for 802.11 header  */
18e2f61db3b708 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5578  		action_frame->len = cpu_to_le16(len - DOT11_MGMT_HDR_LEN);
c2ff8cad64233b drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Antonio Quartulli     2013-06-11  5579  		/* Add the channel. Use the one specified as parameter if any or
c2ff8cad64233b drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Antonio Quartulli     2013-06-11  5580  		 * the current one (got from the firmware) otherwise
c2ff8cad64233b drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Antonio Quartulli     2013-06-11  5581  		 */
c2ff8cad64233b drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Antonio Quartulli     2013-06-11  5582  		if (chan)
c2ff8cad64233b drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Antonio Quartulli     2013-06-11  5583  			freq = chan->center_freq;
c2ff8cad64233b drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Antonio Quartulli     2013-06-11  5584  		else
c2ff8cad64233b drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Antonio Quartulli     2013-06-11  5585  			brcmf_fil_cmd_int_get(vif->ifp, BRCMF_C_GET_CHANNEL,
c2ff8cad64233b drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Antonio Quartulli     2013-06-11  5586  					      &freq);
c2ff8cad64233b drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Antonio Quartulli     2013-06-11 @5587  		chan_nr = ieee80211_frequency_to_channel(freq);
18e2f61db3b708 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5588  		af_params->channel = cpu_to_le32(chan_nr);
ad96bc27032c27 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Joseph Chuang         2020-06-10  5589  		af_params->dwell_time = cpu_to_le32(params->wait);
18e2f61db3b708 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5590  		memcpy(action_frame->data, &buf[DOT11_MGMT_HDR_LEN],
18e2f61db3b708 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5591  		       le16_to_cpu(action_frame->len));
18e2f61db3b708 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5592  
18e2f61db3b708 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5593  		brcmf_dbg(TRACE, "Action frame, cookie=%lld, len=%d, freq=%d\n",
86a9c4a28b2c1a drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Antonio Quartulli     2013-06-19  5594  			  *cookie, le16_to_cpu(action_frame->len), freq);
18e2f61db3b708 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5595  
7fa2e3529c51f1 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel      2013-04-05  5596  		ack = brcmf_p2p_send_action_frame(cfg, cfg_to_ndev(cfg),
18e2f61db3b708 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5597  						  af_params);
18e2f61db3b708 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5598  
18e2f61db3b708 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5599  		cfg80211_mgmt_tx_status(wdev, *cookie, buf, len, ack,
18e2f61db3b708 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5600  					GFP_KERNEL);
18e2f61db3b708 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5601  		kfree(af_params);
a0f07959ee6e7f drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5602  	} else {
a0f07959ee6e7f drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5603  		brcmf_dbg(TRACE, "Unhandled, fc=%04x!!\n", mgmt->frame_control);
5b5e0928f742cf drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Alexey Dobriyan       2017-02-27  5604  		brcmf_dbg_hex_dump(true, buf, len, "payload, len=%zu\n", len);
0de8aace0ff499 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5605  	}
a0f07959ee6e7f drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5606  
18e2f61db3b708 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5607  exit:
0de8aace0ff499 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5608  	return err;
0de8aace0ff499 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5609  }
0de8aace0ff499 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Hante Meuleman        2013-02-08  5610  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
