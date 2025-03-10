Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871341D47C3
	for <oe-kbuild@lists.linux.dev>; Mon, 10 Mar 2025 08:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741594857; cv=none; b=j9QiReqtIay+njn0iEN37VmD0Coh+r61RVS1fHBirrNVoW/IYz9FSQ9n7ujT/SHBt7+EQ1Eiz7tsJPoIuNBqqg1FzYmR/vZRY+YiGEtOr0b31I4kSFSTDJMRldCzq//roB3DCGnmIn5Uohxql0DVqQrJwkjQTRyhJ/qMDS4yIsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741594857; c=relaxed/simple;
	bh=a3XRq5SZMIxfZ+2Mgp5d2cHVY8T95QU6b1B4CIW7pak=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=K8tpapKSkdiBG+a3X1XyUp/tCXS5IhWTUR2Qi9RVHpPZkuSlo4yR20YhbQCzdg2cLBM5ewNe4js/L5IIIZCsKHK1qYI7Kb9IspVZhwk175Y5QgQpMDM5OiqSA8TszZi02awNU6xcXzbLzl930xPHpF8AqzRRHEhxL/+k67Vj2qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=goublSDT; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="goublSDT"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43948021a45so33418905e9.1
        for <oe-kbuild@lists.linux.dev>; Mon, 10 Mar 2025 01:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741594853; x=1742199653; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/IRa+YB+4QLff7q5apAvMehk6zSiN1B98VZ8cSYC1R0=;
        b=goublSDTxT/b/mK9MDsVxrPVX1vNhAkyveL85dQwuEq3rPEYmHohQZIvErZlM1Ag1K
         6xui4Nk3Je0jbLzD+GWUAXzgUEjCqyZsDguX6xZfbShoW3ykO+7okU9hkt1CfSOytD/H
         phEAGZs+Zgus2lrYZdWqa70Cebbkwib7cCEhbVx7B8JocH3FM1oGSFRVEpmt7iHGi24U
         oZNqyn9r4Lc5nBypyeSVXK8dzRB+yJAE+u6UckKCvhpfPNeX0ghDilkYabzNJ4KSMlCx
         GpulNVev2ebUOgxkY4WzQPI9Z2MR0rkZ/A5LxlbeBjuViy9ZP5undhHnqBCosVkWQcTH
         9Bwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741594853; x=1742199653;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/IRa+YB+4QLff7q5apAvMehk6zSiN1B98VZ8cSYC1R0=;
        b=k1zl9RQnWi0s6JMwUQN3b+OOjk4VKKpCe1X39hJ0loRmosmY2UGCFYx0Zf0wh6cvyc
         9y5ndZNiCxmtTZv42PK/PXH2o8UP9OAa5UBPwiJntxkaFEswBf99WiNnpdEMeOD52MOP
         oFZVYJ98prgpD+LAlaOUNFzXpyXB9C34gJZzUuk65vx8RTxOd8Rb6ggPG4JxmPoQNuuw
         KTqhDxHLiafxFlXzaUbpUjlyZsjxjvMRw932oemM07HWW3tQftzP333Q0kd4DRDFNzel
         Pt0GrSEAjXrEFRH5jBC3JVMfF7pOf0s5N34HLjaroC0aslcstOCw4PWRmzkQ70zqvZ7/
         vhPA==
X-Gm-Message-State: AOJu0YyHxDRTA3XAH4J7K93DsNdmS/uM9sWkN/hNRjX58fT7lk3j7WRh
	s3WF0mLQZNty/xTk4ecNOBIabtVOd66DrThlQb7k3nH2BjuiSPCNC2IT4Un+gmUmVi+BHMWd9wd
	e
X-Gm-Gg: ASbGncsjBu7tlde/JJMr65TdJ7wtgh8RBwHvr38CAM/k2/07yksro4ztijOzjIvhRxN
	7Lok4QI1sdK4dxYkmCC/HaQZ5yhjh4NGYif+CljoG6krjEpovMvHhp8dTQT3oWdETKsus4e0W+i
	ElPD12lfsyps908lURCwtCYtkAFWq+IYabKtSrGJ6DKjaIh+BKBQyQOGY4rzLZgn/R76tecuQVD
	12rftTdBT4HRb+2cPMvGaiJc7IAjsFIJy3jtnY4+ruy1j5Z/6zTPIbr/10T2tKRte+XcYj+43q9
	piOp4Eh+mQYJN/1JZLDtYX85VIXGgD/IYsStL6okYHzM+Cbg8w==
X-Google-Smtp-Source: AGHT+IEGATgu5VbdS6kbtg3c6tfuRZz15xP7b2oCeJs8qye1D0o8hlDPBidbACz+FOSKn4FK+JvF+A==
X-Received: by 2002:a5d:47a2:0:b0:391:12a5:3c95 with SMTP id ffacd0b85a97d-39132d6b98dmr7210587f8f.22.1741594852971;
        Mon, 10 Mar 2025 01:20:52 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3912bfba87csm14444368f8f.17.2025.03.10.01.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 01:20:52 -0700 (PDT)
Date: Mon, 10 Mar 2025 11:20:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Casey Schaufler <casey@schaufler-ca.com>,
	paul@paul-moore.com, eparis@redhat.com,
	linux-security-module@vger.kernel.org, audit@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, jmorris@namei.org,
	serge@hallyn.com, keescook@chromium.org,
	john.johansen@canonical.com, penguin-kernel@i-love.sakura.ne.jp,
	stephen.smalley.work@gmail.com, linux-kernel@vger.kernel.org,
	selinux@vger.kernel.org
Subject: Re: [PATCH v2 6/6] Audit: Add record for multiple object contexts
Message-ID: <f57dc6f4-cc46-4a58-9525-1dfda105ea59@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307183701.16970-7-casey@schaufler-ca.com>

Hi Casey,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Casey-Schaufler/Audit-Create-audit_stamp-structure/20250308-024950
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/selinux.git next
patch link:    https://lore.kernel.org/r/20250307183701.16970-7-casey%40schaufler-ca.com
patch subject: [PATCH v2 6/6] Audit: Add record for multiple object contexts
config: powerpc64-randconfig-r073-20250309 (https://download.01.org/0day-ci/archive/20250310/202503100802.Dqju4qc5-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202503100802.Dqju4qc5-lkp@intel.com/

smatch warnings:
kernel/auditsc.c:1753 audit_log_exit() warn: if statement not indented

vim +1753 kernel/auditsc.c

e54dc2431d740a Amy Griffis        2007-03-29  1749  	for (aux = context->aux_pids; aux; aux = aux->next) {
e54dc2431d740a Amy Griffis        2007-03-29  1750  		struct audit_aux_data_pids *axs = (void *)aux;
e54dc2431d740a Amy Griffis        2007-03-29  1751  
e54dc2431d740a Amy Griffis        2007-03-29  1752  		for (i = 0; i < axs->pid_count; i++)
e54dc2431d740a Amy Griffis        2007-03-29 @1753  			if (audit_log_pid_context(context, axs->target_pid[i],
c2a7780efe37d0 Eric Paris         2008-01-07  1754  						  axs->target_auid[i],
c2a7780efe37d0 Eric Paris         2008-01-07  1755  						  axs->target_uid[i],
4746ec5b01ed07 Eric Paris         2008-01-08  1756  						  axs->target_sessionid[i],
13d826e564e2cc Casey Schaufler    2024-10-09  1757  						  &axs->target_ref[i],
c2a7780efe37d0 Eric Paris         2008-01-07  1758  						  axs->target_comm[i]))
e54dc2431d740a Amy Griffis        2007-03-29  1759  			call_panic = 1;

This should be indented another tab.

a5cb013da773a6 Al Viro            2007-03-20  1760  	}
a5cb013da773a6 Al Viro            2007-03-20  1761  
e54dc2431d740a Amy Griffis        2007-03-29  1762  	if (context->target_pid &&
e54dc2431d740a Amy Griffis        2007-03-29  1763  	    audit_log_pid_context(context, context->target_pid,
c2a7780efe37d0 Eric Paris         2008-01-07  1764  				  context->target_auid, context->target_uid,
4746ec5b01ed07 Eric Paris         2008-01-08  1765  				  context->target_sessionid,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

