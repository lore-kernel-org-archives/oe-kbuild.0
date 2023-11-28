Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B27910A2B
	for <oe-kbuild@lists.linux.dev>; Tue, 28 Nov 2023 06:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="thq4OIHW"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40b4744d603so12379385e9.2
        for <oe-kbuild@lists.linux.dev>; Mon, 27 Nov 2023 22:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701152714; x=1701757514; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AztDr/PX7XV6GxnUCezhc7mi8f7rsQ2h0k5PO8WzIi4=;
        b=thq4OIHW2wqIeWrfJLUakhAWnxNoWd116lXaJCIugWhtF7OWdKbZsVXHrJOf0w5jq7
         dzNFf4f8xY71bbbHzzitKsgP7i5+ffKVguA8USJL8YYEVaZAbhH98rit+QejNZU4p+fb
         kZh1oxwwIdv7/zDToQLY9GrvZbkXTdVjL2dJ09xooWNs6mnnKGn7Y09jbH0Nk9qb968U
         JxGPC+snLw2GiMfryiI8enDMqFF9hwstxvFqkyqmxyuiq7SncWqPSJ5dIT1L4qvzkKqG
         VGw5yKx4/07YiWC+/Sk7jOALwjiekh8xqgBdjCMi/QgONsvap0QHaHwHtXER4AoZUjqw
         Jvbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701152714; x=1701757514;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AztDr/PX7XV6GxnUCezhc7mi8f7rsQ2h0k5PO8WzIi4=;
        b=t4wnB8A+4TtkKjSBw3PW6x1MqdWHwlOd6mK0hmf/SWidO/8nuHz+CV+U8Ic1yIhV5C
         nNCYa7b54x21xsKNOQAn0YxF4yPp6A+VBuHaasxB02lDCkeCzRkriXdStVA9BKIQjWjN
         Wz7IHT+o6RtAg72euF/T/Urr2wYudC1gsCrbl4LNyF6BJ7yaeom7gayzM6kZf3V2W3UF
         h4vHM9SJZ6n9P0PoGf41o+AxVxkMYZdXWvwGJ3QurCeAVqdZdECriEYHoFMkHqT5zzds
         2miHWsPqQJqMVVeAA+qKQ2EoUwScvUOtevFET+VlMwNKC9URPLFCFBOukf/k69CO95bS
         l9vw==
X-Gm-Message-State: AOJu0YxkKEaek+IyCl3jN3DTK4VBw97rDqK+MhEEGugLrz6NtAQKIkRD
	uPjDNSq3u130P+7F0bVLOoi1R25DNqf5tNe9mzc=
X-Google-Smtp-Source: AGHT+IGZRRriVRMB0blg2rSEXFK0La4zXTF63IwPjb70QBHHyJE0DxMzqh4VW8kV8N+ek/nNlAFikg==
X-Received: by 2002:a5d:44cd:0:b0:332:ead6:3596 with SMTP id z13-20020a5d44cd000000b00332ead63596mr8309050wrr.45.1701152714078;
        Mon, 27 Nov 2023 22:25:14 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o10-20020adfcf0a000000b00332cda91c85sm13879380wrj.12.2023.11.27.22.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 22:25:13 -0800 (PST)
From: Dan Carpenter <dan.carpenter@linaro.org>
X-Google-Original-From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 28 Nov 2023 09:25:11 +0300
To: oe-kbuild@lists.linux.dev,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: drivers/crypto/stm32/stm32-crc32.c:108 stm32_crc_get_next_crc()
 warn: can 'crc' even be NULL?
Message-ID: <9661b53b-8853-4994-94be-9549278a2aac@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   df60cee26a2e3d937a319229e335cb3f9c1f16d2
commit: 9e4e24414cc6b45bd887d746a59691e295431ddf arm64: introduce STM32 family on Armv8 architecture
config: arm64-randconfig-r081-20231127 (https://download.01.org/0day-ci/archive/20231128/202311281111.ou2oUL2i-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20231128/202311281111.ou2oUL2i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311281111.ou2oUL2i-lkp@intel.com/

smatch warnings:
drivers/crypto/stm32/stm32-crc32.c:108 stm32_crc_get_next_crc() warn: can 'crc' even be NULL?
drivers/crypto/stm32/stm32-hash.c:1168 stm32_hash_irq_thread() warn: inconsistent indenting

vim +/crc +108 drivers/crypto/stm32/stm32-crc32.c

10b89c43a64eb0 drivers/crypto/stm32/stm32-crc32.c Nicolas Toromanoff 2020-05-12  102  static struct stm32_crc *stm32_crc_get_next_crc(void)
b51dbe90912a0c drivers/crypto/stm32/stm32_crc32.c Fabien DESSENNE    2017-03-21  103  {
b51dbe90912a0c drivers/crypto/stm32/stm32_crc32.c Fabien DESSENNE    2017-03-21  104  	struct stm32_crc *crc;
b51dbe90912a0c drivers/crypto/stm32/stm32_crc32.c Fabien DESSENNE    2017-03-21  105  
b51dbe90912a0c drivers/crypto/stm32/stm32_crc32.c Fabien DESSENNE    2017-03-21  106  	spin_lock_bh(&crc_list.lock);
49c2c082e00e0b drivers/crypto/stm32/stm32-crc32.c Nicolas Toromanoff 2020-05-12  107  	crc = list_first_entry(&crc_list.dev_list, struct stm32_crc, list);
10b89c43a64eb0 drivers/crypto/stm32/stm32-crc32.c Nicolas Toromanoff 2020-05-12 @108  	if (crc)

list_first_entry() always returns non-NULL but if the list is empty then
the pointer is invalid (but still non-NULL).  Did you mean
list_first_entry_or_null()?

10b89c43a64eb0 drivers/crypto/stm32/stm32-crc32.c Nicolas Toromanoff 2020-05-12  109  		list_move_tail(&crc->list, &crc_list.dev_list);
b51dbe90912a0c drivers/crypto/stm32/stm32_crc32.c Fabien DESSENNE    2017-03-21  110  	spin_unlock_bh(&crc_list.lock);
b51dbe90912a0c drivers/crypto/stm32/stm32_crc32.c Fabien DESSENNE    2017-03-21  111  
10b89c43a64eb0 drivers/crypto/stm32/stm32-crc32.c Nicolas Toromanoff 2020-05-12  112  	return crc;
10b89c43a64eb0 drivers/crypto/stm32/stm32-crc32.c Nicolas Toromanoff 2020-05-12  113  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

