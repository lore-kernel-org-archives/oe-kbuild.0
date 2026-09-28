Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D68936B91C
	for <oe-kbuild@lists.linux.dev>; Mon, 28 Sep 2026 06:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790578375; cv=none; b=UtiP844oY6EajWTpKJgfe52Q/NsRvsLbh/uhFT5U2QaZJ57wUYek55PcW6+jMmYQFc52XA+OWgYj4f+b6iwN89Is5RPSjEBWzmifNSlBH67yNRsOAWinFHJjwfzzxMiKJxD4Jysz2Ytg90cCDN9hvlVQvymsstIVybZEqD0XPfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790578375; c=relaxed/simple;
	bh=U9e3R0KqY8l1B0OpUpNlBZDCfgqZAMfF4DrJiw+mIhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R7ef+iJx2bPwUOMAxGlNiQRKqAh6CkVTbhPodjl09THR/XC9w5nZhN2NXbjd/1wzdmrMwVUmei2oRpEBNxH4i79vTfqLxmBIJXsBwftr33W4r2RC3h7aH4zO5s/hTJiprNdubcKQeMYVQDKRpoewXgh2IPbFsravUGbpUB187rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p5e2CRbb; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p5e2CRbb"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4887d3c59ecso1489274f8f.1
        for <oe-kbuild@lists.linux.dev>; Sun, 27 Sep 2026 23:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790578371; x=1791183171; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aHiVsnql3W2vw2xfyJJOvymbFGjCnTlA9xgGwDre6j0=;
        b=p5e2CRbbNG2S7isdDRYoK4LT5XifxnJbnUTpd4yiSmruNOCb1EAvnE63kuRFNfn/N9
         1AWEh5DSk3jTFsJMh18e3zPugKIQZuH3wg+5hnzPq663o6MQ8URd6PK/AqyIa2mspHaO
         2fbDThdQU4HC9w/5PtsCaoeQwh7b7JHht2oxsu3wR1FNXCYYIMq0LMwj4DfVQ2qG6THg
         TmgPdq+SWczzEWax8Sa1UGNbx+M+yWQWPfmEkK/zOZc1Fm6sAueg1JII53GnAXlRcWDB
         iWPKdeKPwqKluNbkQdPpGBxPSSTvz9YIuG5sHdfRiALgcT3okv489mhDBlPJTnfig6RQ
         HlKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790578371; x=1791183171;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aHiVsnql3W2vw2xfyJJOvymbFGjCnTlA9xgGwDre6j0=;
        b=1nCawBJANv92hYnqSXrgKAShu0c3f7R+q7UIpS2Pv1YmjlFRqqy25O+5HIYCFZFD4V
         pHJkkFwfs7lmKnKl8eT0LC9Tj3yTrv58UjPWtduFOgM5l5afZo9rexcHpZY3/iIl0aNn
         Eh3STMJN9nSHXlfaSplE0VaSFyLZTo5dlbgz5Hpa0xq2wcjXjr5YN25ADroH0PB8RG7x
         uSD+M22wqqtupv8BQkCzoYJgWX2AAtqzh60sufBZH4WvIiiNYnQ1z6S/5gQSK+wAHsXd
         wqZKmaTYvspFlnyzS2q69RLh60Ghc4j4CJ1EcVBZ8wKAcjLNV9zI5cffk1PaIXQ6KpC2
         UGlw==
X-Gm-Message-State: AFq9FYLFH/snpTGn2AXLa7MNUA1K8vpzrt8iKfefiu2+3rKA5wTd1of4
	m2iGOu4rcq1CUkgOSfGpHQHnqo4Dj209P0SJ0kJAWwtfLQt955LCmM1Z
X-Gm-Gg: AYBFou3T4E4h1FBhwQkVipWSig8tGvBl+My948yTgXKAW4qvZULXdG+g4WXo6ef1aid
	ICePmXbeql2OX0AvRusz2Nc0FwJQWvpXUt8qQst2zk3JaVuXFicZBCHZtP/si57YOZ15fPKt0jO
	fakcd2jMEPNIuCstO8+pDp7lFdrsGCy5nXE8pM/W4UnZh6NSMjPKcDfGpZdilDWVQKT2Kg2pysa
	DbCPAI9i2DDqCsOseOGsH+uCmKikC5A5himfPx5Y5MjzZngKjZpVa0oTBm3reP1AnxNWH7ph3yg
	WygrxIYYrKf0jA08TcAaCD3LxAgjRdb7rz+ykAjmH6a+66sUOo4IZwflRmq8Xi+WSuW/788QlDn
	NbpS/hjhWeZP5Y1A8+nidltfCAYKLOfP13oFwo2r3M6sqi93u6DcFPj5NrD46ruosCcSVgOdykz
	+uZch3upkWxsAV7RYRAn6VMCVWVlrk2YiSYa7O569dKWWDroGGuZXn3XiVWdWT/NuuhWk=
X-Received: by 2002:a5d:5f8b:0:b0:488:891e:5a67 with SMTP id ffacd0b85a97d-488891e5cb4mr9792893f8f.19.1790578371348;
        Sun, 27 Sep 2026 23:52:51 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a6470b7sm25560268f8f.27.2026.09.27.23.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 23:52:50 -0700 (PDT)
Date: Mon, 28 Sep 2026 09:52:46 +0300
From: Dan Carpenter <error27@gmail.com>
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>,
	Mario Limonciello <Mario.Limonciello@amd.com>,
	"Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
	"Prasad, Prasad" <venkataprasad.potturu@amd.com>,
	Syed Saba Kareem <syed.sabakareem@amd.com>
Subject: Re: [linux-next:master 6294/10910] sound/soc/sof/amd/acp.c:1469
 handle_amd_sof_acp7x_sdw_pme_event() error: buffer overflow
 'adata->sdw->pdev' 2 <= 3
Message-ID: <aroOvlIaaXjiT_Ti@stanley.mountain>
References: <202609271355.u0pymQoF-lkp@intel.com>
 <eebb7c55-e999-4aa8-a1ab-5a56f39b2382@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eebb7c55-e999-4aa8-a1ab-5a56f39b2382@amd.com>

On Sun, Sep 27, 2026 at 09:29:09PM +0530, Mukunda,Vijendar wrote:
> 
> 
> On 9/27/26 20:52, Dan Carpenter wrote:
> > [You don't often get email from error27@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> > 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   f5f84daefcd92d7a630066635ecea1433ed5eac7
> > commit: be2823854e00558f46f5bbb124bb3f3a3bb9a94a [6294/10910] ASoC: SOF: amd: add SoundWire PM ops for ACP7.B/7.F
> > config: i386-randconfig-2200-20260927 (https://download.01.org/0day-ci/archive/20260927/202609271355.u0pymQoF-lkp@intel.com/config)
> > compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
> > smatch: v0.5.0-9187-g5189e3fb
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <error27@gmail.com>
> > | Closes: https://lore.kernel.org/r/202609271355.u0pymQoF-lkp@intel.com/
> > 
> > New smatch warnings:
> > sound/soc/sof/amd/acp.c:1469 handle_amd_sof_acp7x_sdw_pme_event() error: buffer overflow 'adata->sdw->pdev' 2 <= 3
> ++
> 
> Thank you for the report. This smatch warning is reported because the
> ACP7.B/7.F SoundWire specific patches have not yet landed. Those patches add
> support for 4 SoundWire manager instances and allocate the platform device
> array based on the maximum instance count, which resolves the buffer
> overflow concern flagged here. We are currently waiting for the dependent
> patch series to complete upstream review:
> https://lkml.org/lkml/2026/9/17/1422 https://lkml.org/lkml/2026/9/17/2552 If
> the review of the above series takes longer, we will post the ACP7.B/7.F
> SoundWire patches for upstream review independently and include a note in
> the cover letter documenting the patch series dependency.

Just to be clear, it looks like the bug is there in linux-next already.

Btw, it's better to link to lore.kernel.org instead of lkml.org because
everyone uses b4 these days and we need the email's msg-id and lkml.org
doesn't give you that.

regards,
dan carpenter

