Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926A01B4F1F
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Apr 2026 07:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775894266; cv=none; b=ZGcMqgNCV0SAeK+r2kZnMXkOOzZ3CQBL8PNXgBdtWMXhhD6gzpGSPU9bvZmhZawOxaIaHO/8TyTRbAjctgCmTb7QJbv7nmNcT/whYZAyuU7lt5JJN3uO27JHT9LvOuGsryQ7A5jS4b03DuGugaE0dTY+0i/OTGYwkbFI0wSve7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775894266; c=relaxed/simple;
	bh=PZ7Ue/+reTmCsL+pA/+vn+apUzyEOCWn0Wx7kqyMg0s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dHuzsSq957Pd9TPCdb3Q2Z4lgHZVYojszntjJbdwfr4FSq5dpPTOllCFz4VYzig9SEmI+uT/AhUGz3l1oWCGpeC/UawcXutr3UndqCU8f4AaO62T2avuwyUJpDI3axkEC4K4mHNVVtY0mwD7FGKrQhBkZF8GIZclvc8LIndrnzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dLl22ifQ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dLl22ifQ"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48896199cbaso29729295e9.1
        for <oe-kbuild@lists.linux.dev>; Sat, 11 Apr 2026 00:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775894264; x=1776499064; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FYoxqR7Nig0LUyLiP0DsYCnjDciU52ZMAS8LUKuD7GU=;
        b=dLl22ifQqELr8p2eFpXcdzke1xWtLCrDhKLoA95dI6P4MReT/eI6O35QP57YBtwpnw
         qycNJB5O6sp024hSjB8KrI4F9IQ4OjrIgQM3O/Zk9D3l+025cen3xZoSJ8w+rsp2nTZ4
         61T4M1xQWZL6sWbowku5EXD8ULKKs36jRfQrR/O6A1LKVM0K4tWFR4BUAzCr5hUdqfYe
         on/hBwItl6rVeP+ue+NGDWp6PeR4yTNEZjIyiGyR2eSgE96JsAWnnLxm63p6ws7xYh0e
         MkKluSvzJRjWKVIr6rrm56ajpVj6jlHMDHoHa7a+dLQrWuHCIF5Ekxvm0pvEFvgzGLQ9
         vlQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775894264; x=1776499064;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FYoxqR7Nig0LUyLiP0DsYCnjDciU52ZMAS8LUKuD7GU=;
        b=e0TRVQrnoowZ0OhKQDlR4SMf4LhJerEJhJ5HN3/z62nkF1oXRuLeICoV2J7xKGVXj8
         GabwxX6RNdTgdpPPwQSjtTVa22IKzWXHDOcs15RooRzo8CdHQ0n/aTq3BYw1/t3WsFIJ
         N+sN0Tpdta/pIEQtnedcQSI63vIoDbI5r0CCVKxObwxJJYcH/J4kTihSZvdADPmqTVTk
         vHt2vWFUV+0Jel5Gupu6ShpHrCP9ADK9j+SG5kB2gx+nT2dGBQNr8EcedYPEmj1FSsxi
         HFHNprO9lSxVKdbHrkCebdlyciEibxbLrV15h+dFk7q18Z5eZ7wz+WpAkcCJQoZ7JyH/
         24EA==
X-Gm-Message-State: AOJu0Yx+XNQvUi3U0DQfAHkWFBjBI++6xbdnCpqUgzgLRvtXzU48MOqs
	ZAmYMIFuDi+/0oZwSZKO/yfbfSed9YK7RlNXP4KGXMF0gsZtaciWNHSvz5p+uG6u
X-Gm-Gg: AeBDieuK13Tu8nuJLW/nxYlPTLE9/4UhwAtHq/fUBT11TNlPip/NAO+YD2m55LgvbQ1
	I+ye9iNpJmULUJzGCmuECWKjPjLQ4s3OuvylnD6ESb4Xg1b6PQiyHwnxWmx0TZF1LBR2caMQnQ/
	fSBFteiA1BWC5yG0nBXNDHrtVFiccDS3WSbxV4DqkjQh7xm0Lo7RsKNqIUTABMrwiTZ87B7N/QH
	A8TjCfhG1EbJbe+BBsL4BsUtRRkl0m1/z4TszyI2pMS0qzvu3n1qlDRXKt7w7O1YANjLBNO+/J5
	w29Crhn9/8xeCuNTPMqMKicuC4dRmQn8VZvSgzDO/9ypCWcS7eyQlWnN7AdCkhalxPavT/LvcTk
	QOLOS+vOs6lci76ClqS0NkVwD6BIieuQHuQZyYGKPslFMb9PdFfuEHDtchY9O1nRIsqqHU807YU
	q2YiqqQH3WhjHS5J4R6hg=
X-Received: by 2002:a05:600c:4451:b0:485:1878:7b8c with SMTP id 5b1f17b1804b1-488d684c6bdmr67379265e9.18.1775894263430;
        Sat, 11 Apr 2026 00:57:43 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5d70891sm42837795e9.2.2026.04.11.00.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 00:57:42 -0700 (PDT)
Date: Sat, 11 Apr 2026 10:57:39 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Tiwei Bie <tiwei.btw@antgroup.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Johannes Berg <johannes.berg@intel.com>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>
Subject: arch/um/drivers/vector_kern.c:471 destroy_queue() warn: variable
 dereferenced before check 'qi' (see line 468)
Message-ID: <202604110937.MLUL70Lx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260411075739.MxfqqcZSH7ZQaU46YL3tCSJpAaDGSVGxkuqqpFQQbAw@z>

[ Obviously, the commit just did COMPILE_TEST or something.  Anyway... -dan ]

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7c6c4ed80b874f721bc7c2c937e098c56e37d2f0
commit: b555cb66583e99158cfef8e91c025252cefae55b um: vector: Eliminate the dependency on uml_net
config: um-randconfig-r072-20260411 (https://download.01.org/0day-ci/archive/20260411/202604110937.MLUL70Lx-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project ae825cb8cea7f3ac8e5e4096f22713845cf5e501)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: b555cb66583e ("um: vector: Eliminate the dependency on uml_net")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604110937.MLUL70Lx-lkp@intel.com/

smatch warnings:
arch/um/drivers/vector_kern.c:471 destroy_queue() warn: variable dereferenced before check 'qi' (see line 468)

vim +/qi +471 arch/um/drivers/vector_kern.c

49da7e64f33e80 Anton Ivanov 2017-11-20  464  static void destroy_queue(struct vector_queue *qi)
49da7e64f33e80 Anton Ivanov 2017-11-20  465  {
49da7e64f33e80 Anton Ivanov 2017-11-20  466  	int i;
49da7e64f33e80 Anton Ivanov 2017-11-20  467  	struct iovec *iov;
49da7e64f33e80 Anton Ivanov 2017-11-20 @468  	struct vector_private *vp = netdev_priv(qi->dev);
                                                                                        ^^^^^^^
Dereference

49da7e64f33e80 Anton Ivanov 2017-11-20  469  	struct mmsghdr *mmsg_vector;
49da7e64f33e80 Anton Ivanov 2017-11-20  470  
49da7e64f33e80 Anton Ivanov 2017-11-20 @471  	if (qi == NULL)
                                                    ^^^^^^^^^^
Checked too late.

49da7e64f33e80 Anton Ivanov 2017-11-20  472  		return;
49da7e64f33e80 Anton Ivanov 2017-11-20  473  	/* deallocate any skbuffs - we rely on any unused to be
49da7e64f33e80 Anton Ivanov 2017-11-20  474  	 * set to NULL.
49da7e64f33e80 Anton Ivanov 2017-11-20  475  	 */

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

