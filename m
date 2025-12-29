Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14095194A76
	for <oe-kbuild@lists.linux.dev>; Mon, 29 Dec 2025 01:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766970625; cv=none; b=EsPdAnmGSvXCeFulaWDYSF8EkjYbwTwEEn/VGQUwh/T/MyXXOH9QMq00f0YwX4Lc6XpzUaOlXJtcZoYXShDq86b1E8Fuzxsbr/5wX3oGrJQyNyZt3ZHGRWBGzjRt+1Q0VRKx1tG1udqAD9ixA5sgcnEt5GH6pQO1e7LGQToXGYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766970625; c=relaxed/simple;
	bh=FkNTeMsZxwSqLYc8Os8ox9tzPA0beZCfcDoXTNwo/rY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hPLYm0HdcW3LBASY7MRto4bHkVBcd+eV+P5BcxHuQ8QfHrnu1xuxNLSkgXNmufJ7WK+atjgzpBSETquReGEGuUe+APIQ4njMizTYtrJ9p3wuH2E9DzFidD6Q5HozJzcgGvtK5ULKi3LdnDlVhwyk+XDCdFzsx8LiZJ8ug9YyadI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a1g1UZ94; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D6g4obyr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a1g1UZ94";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D6g4obyr"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSNdJKw322822
	for <oe-kbuild@lists.linux.dev>; Mon, 29 Dec 2025 01:10:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HJ4BWOfev0AxvWtR+KH2UmHGgImxfHsSAZSTOYN05QI=; b=a1g1UZ94UWEI3AW0
	8TGiINT+51HQ3qkfwq8oCbblk28z9UNwEYGXaG0J12KLkrkxLMwiFE1KfKief5gg
	ttApHW3k04k3CxVZNfWk9c1Jp/a0f8e7e6fhQoIMKmW5CMxSfd2SOAcv39+ZdDC0
	wd5NykAL9582sKb1kCSbdOlelSTxF5X22Iuod9AnPD0ym6HDYS/1LBfmVUHIRrh3
	JoL7Ol1hWfntpwVXYpkFpXKknDFOjtdvJ0NoN9tOVQEOycVEOuf+E5HvYz+RvaaW
	0F0/dZ1EDh8IaLGaom7Kg3mNNrjktkRreRYFe/tjq3yzr0mEFRK1d56LO2JYCzkH
	tnhvyQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bbc9v07s4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <oe-kbuild@lists.linux.dev>; Mon, 29 Dec 2025 01:10:22 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7f89d880668so13054748b3a.2
        for <oe-kbuild@lists.linux.dev>; Sun, 28 Dec 2025 17:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766970622; x=1767575422; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HJ4BWOfev0AxvWtR+KH2UmHGgImxfHsSAZSTOYN05QI=;
        b=D6g4obyrGeIB4nIfyop1Z0yqasFR9XT7Y8o4m4s6dIG/osOhWf4C3kNUHVmKqTazRW
         VCbAjOq6HsiUltpgaPz3PH9RtOYooj7rliF2fIbi6cVosiOVyxsBSVaVQXOiz85oQyfF
         HCQHjuohpYTuTal79mcPITMdeHU+ThAN1Uowxkw6XT0sr+baOvezsgImm9o2SVFdzorX
         JGOsJqC6RTouFHp6DSSdujSpJ3BYgbJVX9NaDahElT0jOxYQMDgv3rXhLv1N4cengN9S
         zQ6KKOYNOlc5Fz1QSnOHSH7b79GqhcNoMJ6QCFFwdgMc7b2myjx/24vBZYb1jdDuS51P
         7YMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766970622; x=1767575422;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HJ4BWOfev0AxvWtR+KH2UmHGgImxfHsSAZSTOYN05QI=;
        b=q/dZwkvhOuS2zN5X4agFkpMYMs0LnM/t7VzbvBZICuvkNI6fxQ2KrYRvivot64W2Sg
         iWBQCpym/gKR2jqGYZxliDpqhfJwfCrcm7E5W9Bi6m3hT7fSrfVAmhqDXitqnullJpou
         sLXy4GMf0NefZPFqJpFXFNmZj62YhG+liM93Y7RAzyUK/FGZEwBl/1YoGT8gIMqHXG9Q
         K8Ou5rNJJaZVEbq0LAo0lA4znFMFrvmObcvOkeiiIFIoT9nsNJ5/B5Ib80Ctj15KYz1X
         0MvPu2zYH2JczDzGp3KmBpTaZW0+FG5poVcxAN00XMfT+vBpqSOgIg//l3GhvuzIGXd7
         nPVQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0CPkrE6Y7HZIcn0nwG3zUTxfzWsfhBkv2Ys7D7YRyBWFonvzjzmvICrMtKdkIGconU6DvQYi2tHI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxaZEvQazTneq8fTn+L5N9bGZa2q9UZZF7xKMZmJJLNxsNIYasp
	SBm7cBhyJTRVdlertj0nLKYYrIKxq5C+honNfuK/dTAH8IOLmheN8XXM3yxmbX48e+uxQ/Pue9j
	HoXq/hEuSn7dIqaQ6xLQoOMLWSRPkc5Cv3cLoLYlqvizp3rGVfGuv29TW7ehEQSI=
X-Gm-Gg: AY/fxX5xvEAdFuIErGmB9Htln9lZWpIu2nMRZcoH/arCMNtjIoVbq6Ycf37AaoEKRnP
	61hGo0BI0Vl+WWIN7zpAI5IRpzAq0+fQXyo7pehSFrPa+FwLB/trrWjFaiLB6Y5CY4VLnls1HkR
	yy8/OriFgYo2+M/uTDuvMSZtT7G7mw8H2lVIR/1lGL1jLNVIRh+xRatMRYiux/LZZHj4fQAosc+
	BDNlUp8MgUeEpis33tLz0PEwrkletTHqxI4eiWLxkfhHbARmWGwfO8MWK1JAoCJ7LnWwOoM+POo
	Z1HuZ98pgYsnYvLahtt/WN/QjVsxKyanZqb4U0Q/4oQnE551ggy8dEfcFVMNfxNeoWmWct1cGFc
	AvpqWU+/JJRdnehJgjwmjNRm5b+wlt3E2kFG/uMBy4twv/b55za5kwWWNK6Ptqg==
X-Received: by 2002:a05:6a20:9149:b0:35d:2984:e5fd with SMTP id adf61e73a8af0-376a8eb2ab9mr22015697637.32.1766970621478;
        Sun, 28 Dec 2025 17:10:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHisaB44sK758zI8M5r2trdQNCa7/jhf5rapQP/cqtsPLrHnhK38AjKdwlnpDugDpbu0acp0w==
X-Received: by 2002:a05:6a20:9149:b0:35d:2984:e5fd with SMTP id adf61e73a8af0-376a8eb2ab9mr22015684637.32.1766970620987;
        Sun, 28 Dec 2025 17:10:20 -0800 (PST)
Received: from [10.133.33.23] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7961fbb9sm23834239a12.2.2025.12.28.17.10.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Dec 2025 17:10:20 -0800 (PST)
Message-ID: <c60288a5-189d-4761-99eb-4681effe1252@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 09:10:14 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/8] coresight: tmc: add create/clean functions for
 etr_buf_list
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <202512251923.GDSbVal1-lkp@intel.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <202512251923.GDSbVal1-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zfsRrqB9qeM2d5XwCdCpeSG8pH9Hh0Qe
X-Authority-Analysis: v=2.4 cv=R/sO2NRX c=1 sm=1 tr=0 ts=6951d4fe cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=KKAkSRfTAAAA:8 a=r4nmail-YYtXJwozotMA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=mmqRlSCDY2ywfjPLJ4af:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDAwOCBTYWx0ZWRfX1UmEAtmzYEvu
 IUD9uJcC3U1vu4XH967I2aqa8bsbVN4VkqWPlxUNbcM7XWsokVcHY9hspI0n6bboUcXDgdskccG
 GGnRR8Bp0C08EPXGISBJqyltj2B/pcwhWlQJyGbunG8qOeEJSsguuVKaoJjLrR0p5rMwoBP1Lzr
 uAcGKoLZA4vLWfcBKVFF2NH4ssoqZLnmFv/N+h6LJlbPlyU4dPx6+9rm7Y5DJ6K2ELFG2kaSVul
 80bWgmmMUfMApKwmIeNbHbeaxDGkAGXWnUdHfJf7Kiq2m3GQQqYx/mReYxyywVYgSJoZhugOzr3
 s9EEJkv8LZYB3UgmKapjM2+Zu7ppfsW+/i4GP/GP7xRR6IAFndjVxCgsmKiyZiJgr7he3/li3Fv
 updaGn5LO/zHTTYOcorAZxascyoGE0pzSSFarL91NHsAsw1TGRFAsmA0GekLcGjzUD49rmB9Yta
 ZQQcTPiZ4R/P5knSfMQ==
X-Proofpoint-ORIG-GUID: zfsRrqB9qeM2d5XwCdCpeSG8pH9Hh0Qe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_08,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 adultscore=0 clxscore=1011 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290008



On 12/26/2025 9:17 PM, Dan Carpenter wrote:
> Hi Jie,
> 
> kernel test robot noticed the following build warnings:
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Jie-Gan/coresight-core-Refactoring-ctcu_get_active_port-and-make-it-generic/20251224-171604
> base:   47b7b5e32bb7264b51b89186043e1ada4090b558
> patch link:    https://lore.kernel.org/r/20251224-enable-byte-cntr-for-ctcu-v9-2-886c4496fed4%40oss.qualcomm.com
> patch subject: [PATCH v9 2/8] coresight: tmc: add create/clean functions for etr_buf_list
> config: arm-randconfig-r073-20251225 (https://download.01.org/0day-ci/archive/20251225/202512251923.GDSbVal1-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4ef602d446057dabf5f61fb221669ecbeda49279)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202512251923.GDSbVal1-lkp@intel.com/
> 
> smatch warnings:
> drivers/hwtracing/coresight/coresight-tmc-etr.c:1992 tmc_create_etr_buf_list() warn: passing freed memory 'new_node' (line 1991)
> drivers/hwtracing/coresight/coresight-tmc-etr.c:1992 tmc_create_etr_buf_list() warn: passing zero to 'PTR_ERR'
> 
> vim +/new_node +1992 drivers/hwtracing/coresight/coresight-tmc-etr.c
> 
> 34af91eeb7e78e Jie Gan 2025-12-24  1959  int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes)
> 34af91eeb7e78e Jie Gan 2025-12-24  1960  {
> 34af91eeb7e78e Jie Gan 2025-12-24  1961  	struct etr_buf_node *new_node;
> 34af91eeb7e78e Jie Gan 2025-12-24  1962  	struct etr_buf *sysfs_buf;
> 34af91eeb7e78e Jie Gan 2025-12-24  1963  	int i = 0, ret = 0;
> 34af91eeb7e78e Jie Gan 2025-12-24  1964
> 34af91eeb7e78e Jie Gan 2025-12-24  1965  	/* We dont need a list if there is only one node */
> 34af91eeb7e78e Jie Gan 2025-12-24  1966  	if (num_nodes < 2)
> 34af91eeb7e78e Jie Gan 2025-12-24  1967  		return -EINVAL;
> 34af91eeb7e78e Jie Gan 2025-12-24  1968
> 34af91eeb7e78e Jie Gan 2025-12-24  1969  	/* We expect that sysfs_buf in drvdata has already been allocated. */
> 34af91eeb7e78e Jie Gan 2025-12-24  1970  	if (drvdata->sysfs_buf) {
> 34af91eeb7e78e Jie Gan 2025-12-24  1971  		/* Directly insert the allocated sysfs_buf into the list first */
> 34af91eeb7e78e Jie Gan 2025-12-24  1972  		new_node = kzalloc(sizeof(struct etr_buf_node), GFP_KERNEL);
> 34af91eeb7e78e Jie Gan 2025-12-24  1973  		if (IS_ERR(new_node))
> 34af91eeb7e78e Jie Gan 2025-12-24  1974  			return PTR_ERR(new_node);
> 34af91eeb7e78e Jie Gan 2025-12-24  1975
> 34af91eeb7e78e Jie Gan 2025-12-24  1976  		new_node->sysfs_buf = drvdata->sysfs_buf;
> 34af91eeb7e78e Jie Gan 2025-12-24  1977  		new_node->is_free = false;
> 34af91eeb7e78e Jie Gan 2025-12-24  1978  		list_add(&new_node->node, &drvdata->etr_buf_list);
> 34af91eeb7e78e Jie Gan 2025-12-24  1979  		i++;
> 34af91eeb7e78e Jie Gan 2025-12-24  1980  	}
> 34af91eeb7e78e Jie Gan 2025-12-24  1981
> 34af91eeb7e78e Jie Gan 2025-12-24  1982  	while (i < num_nodes) {
> 34af91eeb7e78e Jie Gan 2025-12-24  1983  		new_node = kzalloc(sizeof(struct etr_buf_node), GFP_KERNEL);
> 34af91eeb7e78e Jie Gan 2025-12-24  1984  		if (IS_ERR(new_node)) {
> 34af91eeb7e78e Jie Gan 2025-12-24  1985  			ret = PTR_ERR(new_node);
> 34af91eeb7e78e Jie Gan 2025-12-24  1986  			break;
> 34af91eeb7e78e Jie Gan 2025-12-24  1987  		}
> 34af91eeb7e78e Jie Gan 2025-12-24  1988
> 34af91eeb7e78e Jie Gan 2025-12-24  1989  		sysfs_buf = tmc_alloc_etr_buf(drvdata, drvdata->size, 0, cpu_to_node(0), NULL);
> 34af91eeb7e78e Jie Gan 2025-12-24  1990  		if (IS_ERR(sysfs_buf)) {
> 34af91eeb7e78e Jie Gan 2025-12-24 @1991  			kfree(new_node);
> 34af91eeb7e78e Jie Gan 2025-12-24 @1992  			ret = PTR_ERR(new_node);
> 
> s/new_node/sysfs_buf/

Thanks for reporting. Will fix it.

-Jie

> 
> 34af91eeb7e78e Jie Gan 2025-12-24  1993  			break;
> 34af91eeb7e78e Jie Gan 2025-12-24  1994  		}
> 34af91eeb7e78e Jie Gan 2025-12-24  1995
> 34af91eeb7e78e Jie Gan 2025-12-24  1996  		/* We dont have a available sysfs_buf in drvdata, setup one */
> 34af91eeb7e78e Jie Gan 2025-12-24  1997  		if (!drvdata->sysfs_buf) {
> 34af91eeb7e78e Jie Gan 2025-12-24  1998  			drvdata->sysfs_buf = sysfs_buf;
> 34af91eeb7e78e Jie Gan 2025-12-24  1999  			new_node->is_free = false;
> 34af91eeb7e78e Jie Gan 2025-12-24  2000  		} else
> 34af91eeb7e78e Jie Gan 2025-12-24  2001  			new_node->is_free = true;
> 34af91eeb7e78e Jie Gan 2025-12-24  2002
> 34af91eeb7e78e Jie Gan 2025-12-24  2003  		new_node->sysfs_buf = sysfs_buf;
> 34af91eeb7e78e Jie Gan 2025-12-24  2004  		list_add(&new_node->node, &drvdata->etr_buf_list);
> 34af91eeb7e78e Jie Gan 2025-12-24  2005  		i++;
> 34af91eeb7e78e Jie Gan 2025-12-24  2006  	}
> 34af91eeb7e78e Jie Gan 2025-12-24  2007
> 34af91eeb7e78e Jie Gan 2025-12-24  2008  	/* Clean the list if there is an error */
> 34af91eeb7e78e Jie Gan 2025-12-24  2009  	if (ret)
> 34af91eeb7e78e Jie Gan 2025-12-24  2010  		tmc_clean_etr_buf_list(drvdata);
> 34af91eeb7e78e Jie Gan 2025-12-24  2011
> 34af91eeb7e78e Jie Gan 2025-12-24  2012  	return ret;
> 34af91eeb7e78e Jie Gan 2025-12-24  2013  }
> 

