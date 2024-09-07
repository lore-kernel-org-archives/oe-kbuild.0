Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8336E28FC
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Sep 2024 16:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725725035; cv=none; b=ZoYZAISltZH/bNpfmoc7jkOcO1BcXzgHWcsH/pDxaLAaHI1Vir9VHlu4WFgOLomjlrL7ekfIY//iPtdcaGvzYsya5H0uaAcR/3FkQQlCImrQZpGuEcA/f4a9mhap0Klz+j4ZqLBALPbkjABQ+Y2laMBw7+PdsXHzIkFYpLp1Bec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725725035; c=relaxed/simple;
	bh=IUo0O1FdUbZtyKRKOTNByKnRTxNLpo5eTbsSTPvW07o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TsKmNijd508tXQcwDID8ux9VWWJrC/cDuV89YB6taFdQPB2ZXeOyL74pvD0BqypQNcD4mvkW2xXqZrxNP7A54CHxJH0mOYUykqW6FhVRPKE6PXHrjUbNvA81WvV2a/Jef3vtV52xQXF7Cewop0B9rU/GuekzSJ6l37MEXFsRgJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SSaIRSkl; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SSaIRSkl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725725034; x=1757261034;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IUo0O1FdUbZtyKRKOTNByKnRTxNLpo5eTbsSTPvW07o=;
  b=SSaIRSklcrtuS7q7q/31IF4zMSPfwK/Bl37pjmuxYztwP83GZrAprcq+
   AedAAl3tFE8Jst0aXuvEebFbP01gNwjBsZcpb+1NOVFQ5qo+Puah+KnbZ
   CXebC7jfuFnF/ED5/uIM2few1c+OZpfjYpWO9/8dzPCfixTcYFF5iFjWt
   OGMaY2r3nG5t3HIWa2hpMSde2SnS0KIfEZvOxYr++/WXtIRaHGnvY19MV
   7bVki1m7y75Zf4LK2Gp8Ho1D9HNzs7LL3yaLzAtK+N1SnnDuKNMGL6oC+
   gxAivRy6Njwfywxzb/Ij/3f/yPVTYEf5dSw+bj5o+cEGoiqpDiUquUSHI
   w==;
X-CSE-ConnectionGUID: 9TtrKIcpRT+K0XPRtCinow==
X-CSE-MsgGUID: tb2VI8VNQOiatjWHme8Cwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="24578114"
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="24578114"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 09:03:54 -0700
X-CSE-ConnectionGUID: N6ck+sRzTsuYecuyPZ5pcg==
X-CSE-MsgGUID: d1v7cJ6jTfyR2iVgxX6eNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="96941333"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 Sep 2024 09:03:52 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smxuf-000Cgf-1W;
	Sat, 07 Sep 2024 16:03:49 +0000
Date: Sun, 8 Sep 2024 00:03:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [morimoto:sound-TDM-spit-2024-09-05 13/15]
 sound/soc/generic/simple-card-utils.c:1090 graph_get_dai_id() warn:
 statement has no effect 3
Message-ID: <202409072354.jBvdw5LH-lkp@intel.com>
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
TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

tree:   https://github.com/morimoto/linux sound-TDM-spit-2024-09-05
head:   f2dc6deeba0553cf79ecb30e76e88ea593f3124b
commit: 8c7603aac45dda53bd582adf8e220cc959fc391b [13/15] ASoC: simple-card-utils: cleanup graph_get_dai_id()
:::::: branch date: 3 days ago
:::::: commit date: 5 days ago
config: i386-randconfig-141-20240907 (https://download.01.org/0day-ci/archive/20240907/202409072354.jBvdw5LH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409072354.jBvdw5LH-lkp@intel.com/

smatch warnings:
sound/soc/generic/simple-card-utils.c:1090 graph_get_dai_id() warn: statement has no effect 3

vim +1090 sound/soc/generic/simple-card-utils.c

92939252458fa2 Kuninori Morimoto 2021-10-12  1027  
fed4be313a55e9 Kuninori Morimoto 2023-06-14  1028  static int graph_get_dai_id(struct device_node *ep)
fed4be313a55e9 Kuninori Morimoto 2023-06-14  1029  {
fed4be313a55e9 Kuninori Morimoto 2023-06-14  1030  	int i, id;
fed4be313a55e9 Kuninori Morimoto 2023-06-14  1031  	int ret;
fed4be313a55e9 Kuninori Morimoto 2023-06-14  1032  
8c7603aac45dda Kuninori Morimoto 2024-09-02  1033  	/*
8c7603aac45dda Kuninori Morimoto 2024-09-02  1034  	 * For example HDMI case, it has video/sound ports,
8c7603aac45dda Kuninori Morimoto 2024-09-02  1035  	 * thus ALSA SoC need to adjust for it.
8c7603aac45dda Kuninori Morimoto 2024-09-02  1036  	 *
8c7603aac45dda Kuninori Morimoto 2024-09-02  1037  	 * HDMI-Sound driver should support .of_xlate_dai_id callback,
8c7603aac45dda Kuninori Morimoto 2024-09-02  1038  	 * and indicate specified DAI ID
8c7603aac45dda Kuninori Morimoto 2024-09-02  1039  	 */
fed4be313a55e9 Kuninori Morimoto 2023-06-14  1040  	ret = snd_soc_get_dai_id(ep);
fed4be313a55e9 Kuninori Morimoto 2023-06-14  1041  	if (ret != -ENOTSUPP)
fed4be313a55e9 Kuninori Morimoto 2023-06-14  1042  		return ret;
fed4be313a55e9 Kuninori Morimoto 2023-06-14  1043  
fed4be313a55e9 Kuninori Morimoto 2023-06-14  1044  	/*
8c7603aac45dda Kuninori Morimoto 2024-09-02  1045  	 * [snd_soc_dai_driver] and [Of-Graph port] relationship
8c7603aac45dda Kuninori Morimoto 2024-09-02  1046  	 *
8c7603aac45dda Kuninori Morimoto 2024-09-02  1047  	 * static struct snd_soc_dai_driver xxx_dais[] = {
8c7603aac45dda Kuninori Morimoto 2024-09-02  1048  	 *	{
8c7603aac45dda Kuninori Morimoto 2024-09-02  1049  	 *		this DAI is handled as "port@0"
8c7603aac45dda Kuninori Morimoto 2024-09-02  1050  	 *	},
8c7603aac45dda Kuninori Morimoto 2024-09-02  1051  	 *	{
8c7603aac45dda Kuninori Morimoto 2024-09-02  1052  	 *		this DAI is handled as "port@1"
8c7603aac45dda Kuninori Morimoto 2024-09-02  1053  	 *	},
8c7603aac45dda Kuninori Morimoto 2024-09-02  1054  	 *	...
8c7603aac45dda Kuninori Morimoto 2024-09-02  1055  	 * };
8c7603aac45dda Kuninori Morimoto 2024-09-02  1056  	 *
8c7603aac45dda Kuninori Morimoto 2024-09-02  1057  	 * driver {
8c7603aac45dda Kuninori Morimoto 2024-09-02  1058  	 *	ports {
8c7603aac45dda Kuninori Morimoto 2024-09-02  1059  	 *		port@0 {
8c7603aac45dda Kuninori Morimoto 2024-09-02  1060  	 *			reg = <0>;
8c7603aac45dda Kuninori Morimoto 2024-09-02  1061  	 *			...
8c7603aac45dda Kuninori Morimoto 2024-09-02  1062  	 *		};
8c7603aac45dda Kuninori Morimoto 2024-09-02  1063  	 *		port@1 {
8c7603aac45dda Kuninori Morimoto 2024-09-02  1064  	 *			reg = <1>;
8c7603aac45dda Kuninori Morimoto 2024-09-02  1065  	 *			...
8c7603aac45dda Kuninori Morimoto 2024-09-02  1066  	 *		};
8c7603aac45dda Kuninori Morimoto 2024-09-02  1067  	 *		...
8c7603aac45dda Kuninori Morimoto 2024-09-02  1068  	 *	};
8c7603aac45dda Kuninori Morimoto 2024-09-02  1069  	 * };
fed4be313a55e9 Kuninori Morimoto 2023-06-14  1070  	 */
fed4be313a55e9 Kuninori Morimoto 2023-06-14  1071  
8c7603aac45dda Kuninori Morimoto 2024-09-02  1072  	/*
8c7603aac45dda Kuninori Morimoto 2024-09-02  1073  	 * Because having "reg" was not so strict requested before on DT, some DT might not have it.
8c7603aac45dda Kuninori Morimoto 2024-09-02  1074  	 * Let's check and use it if exist, otherwise it will count "port".
8c7603aac45dda Kuninori Morimoto 2024-09-02  1075  	 */
8c7603aac45dda Kuninori Morimoto 2024-09-02  1076  	struct device_node *port __free(device_node) = of_get_parent(ep);
fed4be313a55e9 Kuninori Morimoto 2023-06-14  1077  
8c7603aac45dda Kuninori Morimoto 2024-09-02  1078  	ret = of_property_present(port, "reg");
8c7603aac45dda Kuninori Morimoto 2024-09-02  1079  	if (!ret)
8c7603aac45dda Kuninori Morimoto 2024-09-02  1080  		goto count_port;
8c7603aac45dda Kuninori Morimoto 2024-09-02  1081  
8c7603aac45dda Kuninori Morimoto 2024-09-02  1082  	of_property_read_u32(port, "reg", &id);
8c7603aac45dda Kuninori Morimoto 2024-09-02  1083  
8c7603aac45dda Kuninori Morimoto 2024-09-02  1084  	return id;
8c7603aac45dda Kuninori Morimoto 2024-09-02  1085  
8c7603aac45dda Kuninori Morimoto 2024-09-02  1086  count_port:
fed4be313a55e9 Kuninori Morimoto 2023-06-14  1087  	/*
8c7603aac45dda Kuninori Morimoto 2024-09-02  1088  	 * Non HDMI sound case, counting port on its DT is enough. Let's count it.
fed4be313a55e9 Kuninori Morimoto 2023-06-14  1089  	 */
8c7603aac45dda Kuninori Morimoto 2024-09-02 @1090  	struct device_node *node __free(device_node) = of_graph_get_port_parent(ep);
fed4be313a55e9 Kuninori Morimoto 2023-06-14  1091  	i = 0;
8c7603aac45dda Kuninori Morimoto 2024-09-02  1092  	id = -ENODEV;
8c7603aac45dda Kuninori Morimoto 2024-09-02  1093  	for_each_of_graph_port(node, port) {
8c7603aac45dda Kuninori Morimoto 2024-09-02  1094  		for_each_of_graph_port_endpoint(port, endpoint) {
8c7603aac45dda Kuninori Morimoto 2024-09-02  1095  			if (endpoint == ep) {
fed4be313a55e9 Kuninori Morimoto 2023-06-14  1096  				id = i;
8c7603aac45dda Kuninori Morimoto 2024-09-02  1097  				goto end_of_loop;
8c7603aac45dda Kuninori Morimoto 2024-09-02  1098  			}
8c7603aac45dda Kuninori Morimoto 2024-09-02  1099  		}
fed4be313a55e9 Kuninori Morimoto 2023-06-14  1100  		i++;
fed4be313a55e9 Kuninori Morimoto 2023-06-14  1101  	}
8c7603aac45dda Kuninori Morimoto 2024-09-02  1102  end_of_loop:
fed4be313a55e9 Kuninori Morimoto 2023-06-14  1103  
fed4be313a55e9 Kuninori Morimoto 2023-06-14  1104  	return id;
fed4be313a55e9 Kuninori Morimoto 2023-06-14  1105  }
fed4be313a55e9 Kuninori Morimoto 2023-06-14  1106  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
