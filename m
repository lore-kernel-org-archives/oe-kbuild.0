Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30E4BE6A
	for <oe-kbuild@lists.linux.dev>; Sat,  3 Jun 2023 11:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685791173; x=1717327173;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WiDlFwPdMRo6PXzKiNv3Amknsv4pjP1tvNazXae/uVA=;
  b=J83/ChOLlOmgTOLmSG+8+B0ze0kQ3TPD5VbcKuJ6arQyEZ58Qkp/KokW
   rq17b+LF7QiKttM25/nccl9Jp5yslbVZ6o2451PiqWTTU4sGVDLVjAOAI
   MdKpRUNCwEff1lr/C137YDS9iUTlCAoTAW7s3ToK+qatU1jTqrDaQAB2m
   UD6EqiAiuyhdfL9Lo5qU+ocHyuxxyuag5DQFGldGUoHH4qcseRzfZw+PJ
   hy6OvkjkWoQReRBbt+sA2sOtkOPb+k2RP/b1PKBKY1E/Xg0urTY7hTRgC
   X1ekbUjgg2cvAG+62UbEvByHUdXjPFvApq9DlzhbxGyf0nyJ4B1h9YESK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="421878763"
X-IronPort-AV: E=Sophos;i="6.00,215,1681196400"; 
   d="scan'208";a="421878763"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2023 04:19:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="708126973"
X-IronPort-AV: E=Sophos;i="6.00,215,1681196400"; 
   d="scan'208";a="708126973"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 03 Jun 2023 04:19:29 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q5PIA-0001Xp-0Z;
	Sat, 03 Jun 2023 11:19:30 +0000
Date: Sat, 3 Jun 2023 19:19:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 3/5] soundwire: stream: Remove unneeded checks for
 NULL bus
Message-ID: <202306031901.9adyY1Co-lkp@intel.com>
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
In-Reply-To: <20230602101140.2040141-3-ckeepax@opensource.cirrus.com>
References: <20230602101140.2040141-3-ckeepax@opensource.cirrus.com>
TO: Charles Keepax <ckeepax@opensource.cirrus.com>

Hi Charles,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.4-rc4 next-20230602]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Charles-Keepax/soundwire-bandwidth-allocation-Remove-pointless-variable/20230602-181544
base:   linus/master
patch link:    https://lore.kernel.org/r/20230602101140.2040141-3-ckeepax%40opensource.cirrus.com
patch subject: [PATCH v2 3/5] soundwire: stream: Remove unneeded checks for NULL bus
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: x86_64-randconfig-m001-20230531 (https://download.01.org/0day-ci/archive/20230603/202306031901.9adyY1Co-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306031901.9adyY1Co-lkp@intel.com/

smatch warnings:
drivers/soundwire/stream.c:1408 _sdw_prepare_stream() error: uninitialized symbol 'bus'.

vim +/bus +1408 drivers/soundwire/stream.c

0c4a1049cf2987 Sanyog Kale          2018-07-27  1336  
c7a8f049b828dc Pierre-Louis Bossart 2020-01-14  1337  static int _sdw_prepare_stream(struct sdw_stream_runtime *stream,
c7a8f049b828dc Pierre-Louis Bossart 2020-01-14  1338  			       bool update_params)
5c3eb9f7bdf1f1 Sanyog Kale          2018-04-26  1339  {
3a0be1a65b5012 Pierre-Louis Bossart 2019-08-05  1340  	struct sdw_master_runtime *m_rt;
62d9d8d6796c7b Charles Keepax       2023-06-02  1341  	struct sdw_bus *bus;
3a0be1a65b5012 Pierre-Louis Bossart 2019-08-05  1342  	struct sdw_master_prop *prop;
5c3eb9f7bdf1f1 Sanyog Kale          2018-04-26  1343  	struct sdw_bus_params params;
5c3eb9f7bdf1f1 Sanyog Kale          2018-04-26  1344  	int ret;
5c3eb9f7bdf1f1 Sanyog Kale          2018-04-26  1345  
48949722ced4da Vinod Koul           2018-07-27  1346  	/* Prepare  Master(s) and Slave(s) port(s) associated with stream */
48949722ced4da Vinod Koul           2018-07-27  1347  	list_for_each_entry(m_rt, &stream->master_list, stream_node) {
48949722ced4da Vinod Koul           2018-07-27  1348  		bus = m_rt->bus;
5c3eb9f7bdf1f1 Sanyog Kale          2018-04-26  1349  		prop = &bus->prop;
5c3eb9f7bdf1f1 Sanyog Kale          2018-04-26  1350  		memcpy(&params, &bus->params, sizeof(params));
5c3eb9f7bdf1f1 Sanyog Kale          2018-04-26  1351  
5c3eb9f7bdf1f1 Sanyog Kale          2018-04-26  1352  		/* TODO: Support Asynchronous mode */
3424305b8be456 Pierre-Louis Bossart 2019-05-22  1353  		if ((prop->max_clk_freq % stream->params.rate) != 0) {
17ed5bef49f42e Pierre-Louis Bossart 2019-05-01  1354  			dev_err(bus->dev, "Async mode not supported\n");
5c3eb9f7bdf1f1 Sanyog Kale          2018-04-26  1355  			return -EINVAL;
5c3eb9f7bdf1f1 Sanyog Kale          2018-04-26  1356  		}
5c3eb9f7bdf1f1 Sanyog Kale          2018-04-26  1357  
c7a8f049b828dc Pierre-Louis Bossart 2020-01-14  1358  		if (!update_params)
c7a8f049b828dc Pierre-Louis Bossart 2020-01-14  1359  			goto program_params;
c7a8f049b828dc Pierre-Louis Bossart 2020-01-14  1360  
5c3eb9f7bdf1f1 Sanyog Kale          2018-04-26  1361  		/* Increment cumulative bus bandwidth */
5c3eb9f7bdf1f1 Sanyog Kale          2018-04-26  1362  		/* TODO: Update this during Device-Device support */
5c3eb9f7bdf1f1 Sanyog Kale          2018-04-26  1363  		bus->params.bandwidth += m_rt->stream->params.rate *
5c3eb9f7bdf1f1 Sanyog Kale          2018-04-26  1364  			m_rt->ch_count * m_rt->stream->params.bps;
5c3eb9f7bdf1f1 Sanyog Kale          2018-04-26  1365  
c7578c1d628525 Vinod Koul           2019-08-13  1366  		/* Compute params */
c7578c1d628525 Vinod Koul           2019-08-13  1367  		if (bus->compute_params) {
c7578c1d628525 Vinod Koul           2019-08-13  1368  			ret = bus->compute_params(bus);
c7578c1d628525 Vinod Koul           2019-08-13  1369  			if (ret < 0) {
6122d3be2e9aa4 Pierre-Louis Bossart 2021-03-23  1370  				dev_err(bus->dev, "Compute params failed: %d\n",
c7578c1d628525 Vinod Koul           2019-08-13  1371  					ret);
acdae4632e40f0 Shuming Fan          2023-03-16  1372  				goto restore_params;
c7578c1d628525 Vinod Koul           2019-08-13  1373  			}
c7578c1d628525 Vinod Koul           2019-08-13  1374  		}
c7578c1d628525 Vinod Koul           2019-08-13  1375  
c7a8f049b828dc Pierre-Louis Bossart 2020-01-14  1376  program_params:
5c3eb9f7bdf1f1 Sanyog Kale          2018-04-26  1377  		/* Program params */
bfaa3549541cf8 Rander Wang          2020-01-14  1378  		ret = sdw_program_params(bus, true);
5c3eb9f7bdf1f1 Sanyog Kale          2018-04-26  1379  		if (ret < 0) {
17ed5bef49f42e Pierre-Louis Bossart 2019-05-01  1380  			dev_err(bus->dev, "Program params failed: %d\n", ret);
5c3eb9f7bdf1f1 Sanyog Kale          2018-04-26  1381  			goto restore_params;
5c3eb9f7bdf1f1 Sanyog Kale          2018-04-26  1382  		}
48949722ced4da Vinod Koul           2018-07-27  1383  	}
48949722ced4da Vinod Koul           2018-07-27  1384  
5c3eb9f7bdf1f1 Sanyog Kale          2018-04-26  1385  	ret = do_bank_switch(stream);
5c3eb9f7bdf1f1 Sanyog Kale          2018-04-26  1386  	if (ret < 0) {
68d9bfb668d6ee Pierre-Louis Bossart 2023-03-22  1387  		pr_err("%s: do_bank_switch failed: %d\n", __func__, ret);
5c3eb9f7bdf1f1 Sanyog Kale          2018-04-26  1388  		goto restore_params;
5c3eb9f7bdf1f1 Sanyog Kale          2018-04-26  1389  	}
5c3eb9f7bdf1f1 Sanyog Kale          2018-04-26  1390  
48949722ced4da Vinod Koul           2018-07-27  1391  	list_for_each_entry(m_rt, &stream->master_list, stream_node) {
48949722ced4da Vinod Koul           2018-07-27  1392  		bus = m_rt->bus;
48949722ced4da Vinod Koul           2018-07-27  1393  
5c3eb9f7bdf1f1 Sanyog Kale          2018-04-26  1394  		/* Prepare port(s) on the new clock configuration */
5c3eb9f7bdf1f1 Sanyog Kale          2018-04-26  1395  		ret = sdw_prep_deprep_ports(m_rt, true);
5c3eb9f7bdf1f1 Sanyog Kale          2018-04-26  1396  		if (ret < 0) {
17ed5bef49f42e Pierre-Louis Bossart 2019-05-01  1397  			dev_err(bus->dev, "Prepare port(s) failed ret = %d\n",
5c3eb9f7bdf1f1 Sanyog Kale          2018-04-26  1398  				ret);
5c3eb9f7bdf1f1 Sanyog Kale          2018-04-26  1399  			return ret;
5c3eb9f7bdf1f1 Sanyog Kale          2018-04-26  1400  		}
48949722ced4da Vinod Koul           2018-07-27  1401  	}
5c3eb9f7bdf1f1 Sanyog Kale          2018-04-26  1402  
5c3eb9f7bdf1f1 Sanyog Kale          2018-04-26  1403  	stream->state = SDW_STREAM_PREPARED;
5c3eb9f7bdf1f1 Sanyog Kale          2018-04-26  1404  
5c3eb9f7bdf1f1 Sanyog Kale          2018-04-26  1405  	return ret;
5c3eb9f7bdf1f1 Sanyog Kale          2018-04-26  1406  
5c3eb9f7bdf1f1 Sanyog Kale          2018-04-26  1407  restore_params:
5c3eb9f7bdf1f1 Sanyog Kale          2018-04-26 @1408  	memcpy(&bus->params, &params, sizeof(params));
5c3eb9f7bdf1f1 Sanyog Kale          2018-04-26  1409  	return ret;
5c3eb9f7bdf1f1 Sanyog Kale          2018-04-26  1410  }
5c3eb9f7bdf1f1 Sanyog Kale          2018-04-26  1411  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
