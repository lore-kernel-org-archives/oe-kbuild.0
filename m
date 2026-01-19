Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967AC309F1D
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Jan 2026 15:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768835903; cv=none; b=oXH+DxhS1SSJfwfZ+Qs073JgRpOVqOv5iD/unLs4yORvjcUhGrZ8LjkHs+dsiQEzF1HxrAMFdihILMY0TpptDgxbJHc5KKI7Oz4+qbL42mM7wT6fPutW8f3AKuU6bi74iA5jdGIN2sGtdzlIFC6xSVIinacsUFIKrdIzNrd3MJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768835903; c=relaxed/simple;
	bh=lOEANHwCtJh+6umJvMQqcuc7G0gpQ3PZxVuYaP67n+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P9h2FljRraCdI7CtSVafNHLfLMROtmMnsqCDic20ECuvgHa42uwWbkqW5ABJlkmI+hXTU7FGja2IOS8reJGkkow57Ks0oM6kigYff66B9NlpDDrx0C5NgVQV5qBvcTqyKQQc6iS6FW/IS/AvkWcL4KBWHetS6RnGaRtAblARWj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Xt8koDz9; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Xt8koDz9"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60JCdo1M022744;
	Mon, 19 Jan 2026 15:18:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=vHNw7y+EGyg8HS7z/bzUr5rwx+JEjV
	6ThnP9+S/oZG8=; b=Xt8koDz9yjJ9tkToBi2nGOcGWQTrT/K7mmQ2sCzMVcxZJa
	iAeqkByTpSiLTYDUR1GEvBvcA3y4MJeXtB3MoFwFfUU4Ve3LZsEzbH8ki7OHR02+
	O84roF5smLNyiAJdVtSQIoqqhL3mLopU3ip9BA20FFB2dxPZSLDRwJkTQPu/wL3Y
	1E923xPrssbGMLBPg8DYMU/IhzB6+yiGyYn8HtoF8LhNFRAYflNbMIiq3L2+aH2m
	rhTLk5M3WJc3l1/Ix2eEwMWqLsZLQZsKt2ls+0++2+FBnwQlhG1oaX1k7P3jfghW
	MXjDCrPspcxfVHuWJeSXFI0lV5uIk8LRVNKQUCDw==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bqyuk0k2u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Jan 2026 15:18:17 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60JExlFP006399;
	Mon, 19 Jan 2026 15:18:16 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4brqf1759p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Jan 2026 15:18:16 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60JFIEs359703612
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Jan 2026 15:18:14 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CCFE420043;
	Mon, 19 Jan 2026 15:18:14 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1CD3120040;
	Mon, 19 Jan 2026 15:18:14 +0000 (GMT)
Received: from li-dc0c254c-257c-11b2-a85c-98b6c1322444.ibm.com (unknown [9.39.21.187])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 19 Jan 2026 15:18:13 +0000 (GMT)
Date: Mon, 19 Jan 2026 20:48:11 +0530
From: Ojaswin Mujoo <ojaswin@linux.ibm.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild@lists.linux.dev
Subject: Re: [tytso-ext4:dev 25/37] fs/ext4/extents-test.c:518:1: sparse:
 sparse: bad integer constant expression
Message-ID: <aW5LM7-CbVX0TQAC@li-dc0c254c-257c-11b2-a85c-98b6c1322444.ibm.com>
References: <202601192148.Lwa0CTlR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202601192148.Lwa0CTlR-lkp@intel.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDEyOCBTYWx0ZWRfX+UTkc37LkQvq
 yIjguyrE3Y3iTIDGERxVRhYM2Y7ISsmciv5fXrp8fOB+P1nwhz/mt2+FIeDWTIvvVQJl/N/eHmG
 2TKyH8rlsKE13hhDPbTIY1G64ecU9CUBBJME8+V8Xca+duAYV6FvkLFbgZkvNBFrJ5E4ZkzpacZ
 X115vTThBEINWcG9x3I25X0j+yBINaLc3ucP0lkFy7iOfvvWP719HtTRraFUupPJpyeK9PKfIh8
 NKC5l+FUY0fhF7TCrRbvQfZBKwh+NfxZhKy5NQLtdyhqQrRnD88o+6Fo6fKB3S9wg+mDfuW3Lne
 YjA2lue5KCSFCXpZpJM6okQdv7Ik3JtvIBO5hBCahRjpllIvn33WGx6oZ1x8d6fbAc3H8G6PAxl
 kwwmFo2MOB349cnE0gSu4tT6WjOxdR5dnGOh3DXw3+dOS6FkvNmf/Y+661TU7LpOIXrZlN7fDH2
 5dRIQHXHEUp2Q8/mjPQ==
X-Authority-Analysis: v=2.4 cv=bsBBxUai c=1 sm=1 tr=0 ts=696e4b39 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=NEAV23lmAAAA:8
 a=VnNF1IyMAAAA:8 a=JZzHcGuT9iNUqMdXSXMA:9 a=CjuIK1q_8ugA:10
 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-ORIG-GUID: NJdEWqqe8vvjqL6KAkSYYtgIVHZtfPZv
X-Proofpoint-GUID: NJdEWqqe8vvjqL6KAkSYYtgIVHZtfPZv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_03,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 clxscore=1011 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2601150000 definitions=main-2601190128

On Mon, Jan 19, 2026 at 10:00:06PM +0800, kernel test robot wrote:
> :::::: 
> :::::: Manual check reason: "low confidence static check warning: fs/ext4/extents-test.c:518:1: sparse: sparse: bad integer constant expression"
> :::::: 
> 
> BCC: lkp@intel.com
> CC: oe-kbuild-all@lists.linux.dev
> CC: linux-ext4@vger.kernel.org
> TO: Ojaswin Mujoo <ojaswin@linux.ibm.com>
> CC: "Theodore Ts'o" <tytso@mit.edu>
> CC: Jan Kara <jack@suse.cz>
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
> head:   a4ffc45fdcdc4e94a8acf7dd3342cf1d1a2cdabf
> commit: 16bbdb54f49e58d51dbf2217bab9ed424172ea9a [25/37] ext4: kunit tests for extent splitting and conversion
> :::::: branch date: 10 hours ago
> :::::: commit date: 21 hours ago
> config: microblaze-randconfig-r123-20260119 (https://download.01.org/0day-ci/archive/20260119/202601192148.Lwa0CTlR-lkp@intel.com/config)
> compiler: microblaze-linux-gcc (GCC) 10.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260119/202601192148.Lwa0CTlR-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/r/202601192148.Lwa0CTlR-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
>    fs/ext4/extents.c: note: in included file:
> >> fs/ext4/extents-test.c:518:1: sparse: sparse: bad integer constant expression
>    fs/ext4/extents-test.c:518:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
> >> fs/ext4/extents-test.c:518:1: sparse: sparse: bad integer constant expression
>    fs/ext4/extents-test.c:518:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
> 
> vim +518 fs/ext4/extents-test.c
> 
> 16bbdb54f49e58 Ojaswin Mujoo 2026-01-14  517  
> 16bbdb54f49e58 Ojaswin Mujoo 2026-01-14 @518  MODULE_LICENSE("GPL");

Hmm I see sparse reporting many such issues on MODULE_* .. but not sure
what its about. I'll check it out

Regards,
ojaswin
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
