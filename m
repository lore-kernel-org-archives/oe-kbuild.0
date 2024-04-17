Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF8A173325
	for <oe-kbuild@lists.linux.dev>; Wed, 17 Apr 2024 18:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713377331; cv=none; b=OPR/uGFOZNlKA0ViuWwWy03t/XDR4NymQdvEYyGc+E76FGFqMDbW7SNjuxuEZq4t8ITGoxkFU3CgbgF4YEFFSA0PDV/JT1orUwEeY77MMEePQEAbcqRge6ojhxigISKjch+InxSrgXlDb0otdBowJWOK/SUBTkLpu6/7Pl9Q6hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713377331; c=relaxed/simple;
	bh=uJ5v1jt/3xrupY2eFoZwiWpvIRIEsIFpdqRkLLBC03s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=ETzCiBg+UvBOREHlhT8tlLlYaA7PoWPTZnaJrFfbzXKw3ZAfIq6rSWPdl0WbqJ3m/glZ9fPR2Xi08+quuR6guX1IKVWqFpb3gt7sTiLsIze+84VLy+JxD9ahYcFS5SE9c73XuddVlqmdUq4THDSIGsKWAbR2uXiUOGCJ7posdyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gzuKOATy; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gzuKOATy"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a51a7d4466bso676032166b.2
        for <oe-kbuild@lists.linux.dev>; Wed, 17 Apr 2024 11:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713377327; x=1713982127; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=smloynM7fJQsDmi6Ly/M7gsorOUchbbkFXvOhhW/pH8=;
        b=gzuKOATyp6Pt/9E4i4wPjxF2eu3B38jzoR7//HXdIq/G3nEQb5PhB1BAu4F6SYJ1BO
         HBZ3u8n4txcprrGVLmnWZkqhEjCWQQDlKx/oo/UoyXSaMZtnvORZV0UMuOgzbKc0kXw4
         PL8ykSlvqbwm6c1OlFFEJcwy4oMKCJKeQZDHxlPKvRtYhJg3s9toK9hoLOfTQmh4dhS1
         4EZoJuWSm+1zv6lkpfptlt0iSztu0+9eis5cv2GpcJPqX3mzFeLArh+J/FrFKfcljdKA
         SKaMUc+C0Crs3+e6vTb8n22E6zNAgRm5B9Oft3bUEb2/zWrA3kEgOYwhO1yGlNj50ix2
         R8rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713377327; x=1713982127;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=smloynM7fJQsDmi6Ly/M7gsorOUchbbkFXvOhhW/pH8=;
        b=jV+wSyH+Enx/TvGzR03ttYbZZtNvYU8ykzu7eO88DcT0frUhK0FHfCpRoKWXL7L6iR
         Z1jFTUo6dlWTgBKXYLOl7d1bKfjTI8xWGSQncOsc7LjmwsqF5lRkGpSXGe95WjWKcMeb
         Ifq/joeIh+0QBTulCjXkGjlD940ZFtRyuWWi+Rl0t+OhjLLLMbc2Dz/4qjqEFQvY7pTq
         cy8gEiy2aenSWenxh3bxTu8S/FkzJ0y3fvMFHCV3BlaWEjAZL5E2CJ/MHMi409mFTFQE
         sOVzy1kOeMYXeYSaFCgRSV93aXFk7cOPLzpsfrMgkTYV/atxQWW6/ooPcJ9q869A8Jkh
         JKfA==
X-Gm-Message-State: AOJu0YzxjtUE8SB0riMknsuY8rrM0LXB32wAVqae/SqR8k+0KjzaO1sT
	5E3ddC48t/x1wSXVVbayibczRCHkxAIQcMYaB9Ti+x4Qsa1jmKkUnrYZ362YO4v/HPqI1T5qqfM
	j
X-Google-Smtp-Source: AGHT+IGhJiNkCMkOyGk0LfZLLEky0z09T9gj2Uq8zgjLyWia0fsntM3spbqybvS4qSutvJ6D3xpwGw==
X-Received: by 2002:a17:906:3491:b0:a51:a06e:afd1 with SMTP id g17-20020a170906349100b00a51a06eafd1mr187751ejb.23.1713377327128;
        Wed, 17 Apr 2024 11:08:47 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id gs16-20020a170906f19000b00a4e48e52ecbsm598618ejb.198.2024.04.17.11.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 11:08:46 -0700 (PDT)
Date: Wed, 17 Apr 2024 21:08:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Geetha sowjanya <gakula@marvell.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, kuba@kernel.org,
	davem@davemloft.net, pabeni@redhat.com, edumazet@google.com,
	sgoutham@marvell.com, gakula@marvell.com, sbhatta@marvell.com,
	hkelam@marvell.com
Subject: Re: [net-next PATCH 5/9] octeontx2-af: Add packet path between
 representor and VF
Message-ID: <bd981ef9-f888-4cba-8fdb-46738198105a@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240416050616.6056-6-gakula@marvell.com>

Hi Geetha,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Geetha-sowjanya/octeontx2-pf-Refactoring-RVU-driver/20240416-131052
base:   net-next/main
patch link:    https://lore.kernel.org/r/20240416050616.6056-6-gakula%40marvell.com
patch subject: [net-next PATCH 5/9] octeontx2-af: Add packet path between representor and VF
config: alpha-randconfig-r081-20240417 (https://download.01.org/0day-ci/archive/20240417/202404172319.ys4PQfP0-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202404172319.ys4PQfP0-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/marvell/octeontx2/af/rvu_rep.c:23 rvu_rep_get_vlan_id() warn: signedness bug returning '(-19)'

vim +23 drivers/net/ethernet/marvell/octeontx2/af/rvu_rep.c

5c25d7a685d906 Geetha sowjanya 2024-04-16  16  static u16 rvu_rep_get_vlan_id(struct rvu *rvu, u16 pcifunc)
                                                      ^^^
u16 type

5c25d7a685d906 Geetha sowjanya 2024-04-16  17  {
5c25d7a685d906 Geetha sowjanya 2024-04-16  18  	int id;
5c25d7a685d906 Geetha sowjanya 2024-04-16  19  
5c25d7a685d906 Geetha sowjanya 2024-04-16  20  	for (id = 0; id < rvu->rep_cnt; id++)
5c25d7a685d906 Geetha sowjanya 2024-04-16  21  		if (rvu->rep2pfvf_map[id] == pcifunc)
5c25d7a685d906 Geetha sowjanya 2024-04-16  22  			return id;
5c25d7a685d906 Geetha sowjanya 2024-04-16 @23  	return -ENODEV;
                                                ^^^^^^^^^^^^^^

5c25d7a685d906 Geetha sowjanya 2024-04-16  24  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

