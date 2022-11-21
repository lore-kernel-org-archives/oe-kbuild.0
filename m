Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B143D84;
	Mon, 21 Nov 2022 13:46:09 +0000 (UTC)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2ALCdRCB008204;
	Mon, 21 Nov 2022 07:13:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=05ANpNcoPXhJ7RrJcplQMHmGzGUwmkUTtSBazj355Wk=;
 b=jDT7kxfMFl9gDXniI8bsgk3ArwSF4VGBfOYVZkBZ51pPzQTEZ1cH/5iwE+vyM/r4vuyV
 joUsEFeF8Vp4ePsdFmZanJl40B7mSToXrtnHdDxzeH8O/H41WKuYMPdNCw+RHPMwdodC
 O/qgz/o7Gb7RB8AUyJWKe/cpHPNn5CD+P62Ao0fvRaKWyXySUtTxPJzFxwr4dWn8VRMA
 aG/Cc9yVQEkG+mACEsG0N2d44cSyJPaB18YTaRo5aCunpa4dJ6Znw4uHl9hZHbVn/wLX
 c41vlZPcB1069unPIAa+6t1g/rnrKFP6UnfRTm23x1GiOGSwf9+GXDGyGUy7laqmyRCc Mg== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3kxwe6t5g4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Nov 2022 07:13:30 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Mon, 21 Nov
 2022 07:13:28 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.20 via Frontend
 Transport; Mon, 21 Nov 2022 07:13:28 -0600
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id F0060468;
	Mon, 21 Nov 2022 13:13:27 +0000 (UTC)
Date: Mon, 21 Nov 2022 13:13:27 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Dan Carpenter <error27@gmail.com>
CC: <oe-kbuild@lists.linux.dev>, <vkoul@kernel.org>, <lkp@intel.com>,
        <oe-kbuild-all@lists.linux.dev>, <yung-chuan.liao@linux.intel.com>,
        <pierre-louis.bossart@linux.intel.com>, <sanyog.r.kale@intel.com>,
        <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: Re: [PATCH 3/4] soundwire: debugfs: Switch to sdw_read_no_pm
Message-ID: <20221121131327.GU10437@ediswmail.ad.cirrus.com>
References: <20221114102956.914468-4-ckeepax@opensource.cirrus.com>
 <202211210539.6lHevRnx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202211210539.6lHevRnx-lkp@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: YmcFds_xBpu5r6B5_0P-EOXQMOc9hnsF
X-Proofpoint-GUID: YmcFds_xBpu5r6B5_0P-EOXQMOc9hnsF
X-Proofpoint-Spam-Reason: safe

On Mon, Nov 21, 2022 at 01:50:55PM +0300, Dan Carpenter wrote:
> Hi Charles,
> 
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Charles-Keepax/Minor-SoundWire-clean-ups/20221114-183333
> patch link:    https://lore.kernel.org/r/20221114102956.914468-4-ckeepax%40opensource.cirrus.com
> patch subject: [PATCH 3/4] soundwire: debugfs: Switch to sdw_read_no_pm
> config: loongarch-randconfig-m041-20221114
> compiler: loongarch64-linux-gcc (GCC) 12.1.0
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> 

Thanks for the spot I will fix this up and do a v3.

Thanks,
Charles
