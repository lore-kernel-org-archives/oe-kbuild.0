Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85F42565;
	Mon,  7 Nov 2022 08:01:39 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id v1so14868478wrt.11;
        Mon, 07 Nov 2022 00:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ch+LE7gstKBIpXh5IG3QGfhZroQjP8LDQYrbKVWPxqM=;
        b=oyEMtbJtCLFX5lMBDr/DgCQ/ltvexBJSZjdn0g3qYi5319dOvFreFV3dHnxGAg8bW+
         uZAeLfEYIs6fWT9zNCyvoBBEu6nrxxb8GbFpjxjfJn8WiPx2wfq7V80N/HA7PnQW6PR3
         Mil5xtnJf4mIbF59o/llgBpcmn8VJY7efi4vKk+1kX2Yidfk4rPFLJc2AlYQ1WU4T/sy
         G5uf4kMltYDwpL4bcu9mGcENjyCF6hk7XQtq6/0am5Mh/oDJ7PhgjX+7p8wWLwtW1vLq
         oBjvtUyHOzub+gsehYfE/7S01gQgYS/dABK0pisBF6cGCbE3tH8qTKN9QZXYyNpUTiyR
         dLzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ch+LE7gstKBIpXh5IG3QGfhZroQjP8LDQYrbKVWPxqM=;
        b=dPGOkzHNUF30wMGk6fGDdcQkRuw8WSPYJG8r8hmM1xkwC+bCBYrCugOd8Vshv4rxZO
         mrbrqRbsYtVXUrWWE/Eq6Ov1lfliHIPXjbULyMCTSIxihejKeDxbkG1gc3ybDd9JY+E8
         OulLsYOjmZ1/teluUvYYZCoM9UEHmzDni7B9WDdbUbfJpOIenVokXwyMNK7NRe6DuUyM
         H8Vg7zJCuaiWdPptSPftIU2Ulg8CVPq9Br//m2QDU5d0HBk5nZcDRzIzA0ZjSoWPRVwe
         QiM0wfdAtb1RSbP7vk4z9KGF76j+pLTFfN+5Is1YjcOoBvIgg0BF0JqSmFNPgPTBZyNx
         g+gg==
X-Gm-Message-State: ACrzQf2YHozDl46A3tbMIXXgkMo1MLCVWVXhcjaL/UaRLOqOL9x5FSEC
	Sjc23jhAu6hcGd/cd208HzUdQceagds=
X-Google-Smtp-Source: AMsMyM7HG+n2Rpteeu6Z33tXXS6tw3mSI72ThMGxOBanegLmm+tIcl/KHFv9O36f7Bg3pUzuSgDZzg==
X-Received: by 2002:adf:ee4a:0:b0:236:77fe:5a5a with SMTP id w10-20020adfee4a000000b0023677fe5a5amr548922wro.117.1667808097798;
        Mon, 07 Nov 2022 00:01:37 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id k8-20020a05600c168800b003cf47fdead5sm7290060wmn.30.2022.11.07.00.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 00:01:37 -0800 (PST)
Date: Mon, 7 Nov 2022 11:01:30 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, 'Guanjun' <guanjun@linux.alibaba.com>,
	herbert@gondor.apana.org.au, elliott@hpe.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	zelin.deng@linux.alibaba.com, artie.ding@linux.alibaba.com,
	guanjun@linux.alibaba.com, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, xuchun.shang@linux.alibaba.com
Subject: Re: [PATCH v3 RESEND 8/9] crypto/ycc: Add sm2 algorithm support
Message-ID: <202211060420.IwtCMD76-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1667461243-48652-9-git-send-email-guanjun@linux.alibaba.com>
Message-ID: <20221107080130.Phdm_v70upmUQkuh3w9Neu_CoH5EUhW-0ojHTfUpczU@z>

Hi 'Guanjun',

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Guanjun/Drivers-for-Alibaba-YCC-Yitian-Cryptography-Complex-cryptographic-accelerator/20221103-154448
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/1667461243-48652-9-git-send-email-guanjun%40linux.alibaba.com
patch subject: [PATCH v3 RESEND 8/9] crypto/ycc: Add sm2 algorithm support
config: ia64-randconfig-m031-20221104
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/crypto/ycc/ycc_pke.c:880 ycc_sm2_exit() warn: variable dereferenced before check 'ctx->ring' (see line 878)

vim +880 drivers/crypto/ycc/ycc_pke.c

eb2973011f26b6 Xuchun Shang 2022-11-03  875  static void ycc_sm2_exit(struct crypto_akcipher *tfm)
eb2973011f26b6 Xuchun Shang 2022-11-03  876  {
eb2973011f26b6 Xuchun Shang 2022-11-03  877  	struct ycc_pke_ctx *ctx = akcipher_tfm_ctx(tfm);
eb2973011f26b6 Xuchun Shang 2022-11-03 @878  	struct device *dev = YCC_DEV(ctx);

ctx->ring dereferenced inside YCC_DEV() (says the checker).

eb2973011f26b6 Xuchun Shang 2022-11-03  879  
eb2973011f26b6 Xuchun Shang 2022-11-03 @880  	if (ctx->ring)
                                                    ^^^^^^^^^
Checked too late.

eb2973011f26b6 Xuchun Shang 2022-11-03  881  		ycc_crypto_free_ring(ctx->ring);
eb2973011f26b6 Xuchun Shang 2022-11-03  882  
eb2973011f26b6 Xuchun Shang 2022-11-03  883  	if (ctx->pub_key_vaddr)
eb2973011f26b6 Xuchun Shang 2022-11-03  884  		dma_free_coherent(dev, 64, ctx->pub_key_vaddr, ctx->pub_key_paddr);
eb2973011f26b6 Xuchun Shang 2022-11-03  885  
eb2973011f26b6 Xuchun Shang 2022-11-03  886  	crypto_free_akcipher(ctx->soft_tfm);
eb2973011f26b6 Xuchun Shang 2022-11-03  887  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

