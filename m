Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5BB1D0DEE
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Feb 2026 02:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769998074; cv=none; b=Emwfeg9GQ1YgO4xpFCZgtka06URUwNH7+O56TdWUiyll5KQsQgCf+80g+lErWUNl5VdAFVip+Yym9/NV1VVP3TBjjmGvmy0duPS05eDBszWkubyWo2YyUNgFp1M+eRR8JBg+YmEv8qL89iFFlvBoO1Cq0TIU6JCGxH/JTDzSVxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769998074; c=relaxed/simple;
	bh=ROt5gD7XPQjhnIVF5XiuISWsGMVC+6w3Nv1xKT7Yz5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g17yu799eLiRTgSnYOh3CW1T+jK7Gt7j+25LpyQ74D5SBsQliXOThkKJQ7R3h0TkIwmVYBORXPhbjGorpitbN1IXTQTMErGz9HQhCaK9dWUfImMEPT/uuNt1LLieb1Xqcpfc+X9vNz1hCA3snMvNSczPaQeGg1O6O875wPkbJMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bIqSV/Ya; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NO0HEJ7r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bIqSV/Ya";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NO0HEJ7r"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 611MKZuA1642240
	for <oe-kbuild@lists.linux.dev>; Mon, 2 Feb 2026 02:07:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BxpL/CEFN6q71yIP6BqMQzTd
	ZY/IThsM+HhCgC/mv4I=; b=bIqSV/YalNkdPOlpP/muVM367H5bSW+xY0C9Z2/7
	kiekDgY4iLkOMExRoy7CltSTpgV2mT5iyhiCdhGwf9W0za8iUFs4UcRLoxYitBhj
	m8raXV1B872f5MOO+9OZFY/3Df98e+q3hrFk2QXD+iuj2xvBc+CIb64COU7pyih9
	nOW/5YbUdrcriZQckwnrgQ18uoT0Qaz6Ix6elOZPZy8R98iO9lXv0H5ZJTf+zB1j
	hI25lhmQpmIhbu05iynSQY5YieY0k3/xVh7kxbHmzAY71vdzTXugGTGpp9yARgKk
	q/u4TX8Ahwmm+y+yMO2RLR2HiLAchHYKLwn102TACyV18Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c23h1h8q9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <oe-kbuild@lists.linux.dev>; Mon, 02 Feb 2026 02:07:52 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8946448adbdso164765216d6.1
        for <oe-kbuild@lists.linux.dev>; Sun, 01 Feb 2026 18:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769998071; x=1770602871; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BxpL/CEFN6q71yIP6BqMQzTdZY/IThsM+HhCgC/mv4I=;
        b=NO0HEJ7rxdFLKqyd4+XSbmspjGu41ZcurnJ5REXyCEqY1spYNWKnz2fNWAC4z9Djom
         iPtO7zSNkgOzi0h6QUr2wAGErCFVFRV/Ql443zOkcWKUrOD/MbLCHEOgtUmcz0dCR+J5
         B971fFp+QqbUJnMNvawE0T7ptDVlMIgFz7/T4kihLs1sZoOrd4Q94FcUf7bKMmAsvIbi
         PEEINoXlg0jxJEXyi6kzGHIuGiDmXp4yBds/H5viYlWURYuU02thfhfr7Wwl87wgYPuA
         sivIKzNFrns0Ht6tgjU07kKs2fJIVOV8AfYRZVS+iqMXkGq3RzzTZwGAgovu13ysE7kX
         LbYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769998071; x=1770602871;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BxpL/CEFN6q71yIP6BqMQzTdZY/IThsM+HhCgC/mv4I=;
        b=SPwECTccJNytEeKtC3T1zIKPFXrNJuJbgIphtpjsLBYiknUEkU+qwYQGsnUVyYTsAQ
         hKpeHEm8uo1y/1v8+4tskjkbN/26Ou4jkwD4Lx/owNVghhrGodcOXtcwCcXzVEDWmP3y
         dZRX2Q7PjkXR237zNED2ekTlEyvMzv+FuSl9nxP+tdV5Ts2CPRq10hQV9rxvRHeqDxnm
         N+VUj3q23UsPcSjJ1u57fyBoDbksPdVrkBRUarCrviqU1akHqEbDsQ/h+HtncIq/MHTq
         yIK6bOHtDtCl6Xb6gcfFDF02QjxRiXCmQvUeyCggo0bwl3JBnh4iHU2n/bh4QGsfHQ+5
         Sa9Q==
X-Gm-Message-State: AOJu0YwU+ICRWIP5vpdKzSBvs6zchwprmzDfRtKCLttFAE0ovwAc5dvV
	k4QBnzP6tru6U94TCjIFfxRszx9gw9cNrXZTHae0VJYdILMn/2MLARNj/MvOqaEeOCgDZq3cyqh
	Twe5HJy83ECCPsVqwDQa6JY7yGErQHdaElKs2bBPraWgcUst0nEmtvkhVCg0B004=
X-Gm-Gg: AZuq6aLf+YC00QY/dsAGEiS0fRCEftTNAxKExJQMV1JHNTv4RCSsKx+pCibfLyoRsyD
	+I/UI6C2wmk3qAYlzqy9lbID1Mq5w/zDArvlmqlncJRHZytl2hSCXbvHxNqJvUedjli1/tgoqIq
	lBNVrsAr5Gs608a92IFKQJ5/RDlCMLKA4W/FU+rKUGfs9/lWH6b9Q5dMTFfEviix3vdKXUtcY2i
	nHuVdt3mgD6qvQFlq0kGaTApZ0hPA3BySVb4wOkBPWq6kTZRA5HNSVXnzv+zued43sVev936wUn
	E6na8QIf0aGq1q1yxsGVuDgWa0rMY7TxyTrQ4CUn6QZBExfum7qEHiIxoRE9NDPfi7C17xVXlXx
	90ONBZ//jZ6ZImBZwF8USMUeuXgkuA4iX8oURvg1jXZNIo1n5Xm0kHhDuHb5oh9+5yJyEQRY=
X-Received: by 2002:ad4:5dc8:0:b0:880:4054:7edd with SMTP id 6a1803df08f44-894e9fe6b46mr152935746d6.20.1769998071624;
        Sun, 01 Feb 2026 18:07:51 -0800 (PST)
X-Received: by 2002:ad4:5dc8:0:b0:880:4054:7edd with SMTP id 6a1803df08f44-894e9fe6b46mr152935476d6.20.1769998071139;
        Sun, 01 Feb 2026 18:07:51 -0800 (PST)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c711d2845fsm1148516085a.31.2026.02.01.18.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 18:07:50 -0800 (PST)
Date: Mon, 2 Feb 2026 10:07:45 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
        Dmitry Baryshkov <lumag@kernel.org>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: Re: [linux-next:master 7732/9539]
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c:161
 dpu_hw_sspp_setup_pe_config_v13() warn: variable dereferenced before check
 'ctx' (see line 159)
Message-ID: <aYAG8R8nkSNqdR6b@yuanjiey.ap.qualcomm.com>
References: <202601252214.oEaY3UZM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202601252214.oEaY3UZM-lkp@intel.com>
X-Proofpoint-GUID: ntwtLtK30iSpAmGdaVYebFrvCiFO8r9n
X-Proofpoint-ORIG-GUID: ntwtLtK30iSpAmGdaVYebFrvCiFO8r9n
X-Authority-Analysis: v=2.4 cv=Fu8IPmrq c=1 sm=1 tr=0 ts=698006f8 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8
 a=NEAV23lmAAAA:8 a=KKAkSRfTAAAA:8 a=wTWSiibFJaJYqoySWbQA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=mmqRlSCDY2ywfjPLJ4af:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDAxNSBTYWx0ZWRfX/JaqwLYOYS9s
 5x+Jp4ju3kjNDOdPjak1BouoINJvsmAuKVPTWx3nyS1TQkB1G3Bc25YGTUMbq2AH7pZfYHt1984
 WrMmKwdo8rjKykKEQoeRvSWEvStj9B3qzxox3aymtruoTc4+z1DcljkSNrHDLpklEflZrIj6t2L
 ThTYqaDuerIkUC//Md6CEa2M8eZzPHieb6wThV3oh9C/hvrCkzOv2DxWRVV7RDIaMO3tv7ugI4m
 JEbDxgAjheOsoGE+ruOyFMybQpmxay7HZyAKtPMjKSjFrXnIRwpjrAvucgwiygxvc8F09o9jT1N
 E5MuaWk2pA/58B1iv9XwsyR2+lE+uLW+aculdzwVP2ZVFnnSEDvRgGCQI2tUO5c3nX6zDXL9a4B
 53hxjGniGMRwLuNeM7p4SrsX/oyZOlzaeUhbaBPJ/VOQZp9v0iGhK25E7Q9Xlz6a0RkdCBcYMs6
 IJuLKJ0NriVC2ocvNNA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-01_08,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1011 suspectscore=0 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020015

On Wed, Jan 28, 2026 at 01:04:39PM +0300, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea
> commit: 688c7734002a1ee6f50a28ba9bd7aa380edbe12d [7732/9539] drm/msm/dpu: Add Kaanapali SSPP sub-block support
> config: mips-randconfig-r071-20260125 (https://download.01.org/0day-ci/archive/20260125/202601252214.oEaY3UZM-lkp@intel.com/config)
> compiler: mips64-linux-gcc (GCC) 15.2.0
> smatch version: v0.5.0-8994-gd50c5a4c
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202601252214.oEaY3UZM-lkp@intel.com/
> 
> smatch warnings:
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c:161 dpu_hw_sspp_setup_pe_config_v13() warn: variable dereferenced before check 'ctx' (see line 159)
> 
> vim +/ctx +161 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c
> 
> 688c7734002a1e Yuanjie Yang 2026-01-15  152  static void dpu_hw_sspp_setup_pe_config_v13(struct dpu_hw_sspp *ctx,
> 688c7734002a1e Yuanjie Yang 2026-01-15  153  					    struct dpu_hw_pixel_ext *pe_ext)
> 688c7734002a1e Yuanjie Yang 2026-01-15  154  {
> 688c7734002a1e Yuanjie Yang 2026-01-15  155  	struct dpu_hw_blk_reg_map *c;
> 688c7734002a1e Yuanjie Yang 2026-01-15  156  	u8 color;
> 688c7734002a1e Yuanjie Yang 2026-01-15  157  	u32 lr_pe[4], tb_pe[4];
> 688c7734002a1e Yuanjie Yang 2026-01-15  158  	const u32 bytemask = 0xff;
> 688c7734002a1e Yuanjie Yang 2026-01-15 @159  	u32 offset = ctx->cap->sblk->sspp_rec0_blk.base;
>                                                              ^^^^^
> Dereference
> 
> 688c7734002a1e Yuanjie Yang 2026-01-15  160  
> 688c7734002a1e Yuanjie Yang 2026-01-15 @161  	if (!ctx || !pe_ext)
>                                                      ^^^
> NULL check is too late.

Ok, will fix it in a new patch.

Thanks,
Yuanjie

> 688c7734002a1e Yuanjie Yang 2026-01-15  162  		return;
> 688c7734002a1e Yuanjie Yang 2026-01-15  163  
> 688c7734002a1e Yuanjie Yang 2026-01-15  164  	c = &ctx->hw;
> 688c7734002a1e Yuanjie Yang 2026-01-15  165  	/* program SW pixel extension override for all pipes*/
> 688c7734002a1e Yuanjie Yang 2026-01-15  166  	for (color = 0; color < DPU_MAX_PLANES; color++) {
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 
