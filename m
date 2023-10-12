Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1597C63B3;
	Thu, 12 Oct 2023 05:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1qqnyj-006FFt-6s; Thu, 12 Oct 2023 13:11:22 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 12 Oct 2023 13:11:25 +0800
Date: Thu, 12 Oct 2023 13:11:25 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Dan Carpenter <dan.carpenter@linaro.org>,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [PATCH] crypto: lskcipher - Return EINVAL when ecb_name fails sanity
 checks
Message-ID: <ZSd//fA00pk/XqBC@gondor.apana.org.au>
References: <f9ae1fe1-5a78-442f-a3fb-3c01e6273d3f@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9ae1fe1-5a78-442f-a3fb-3c01e6273d3f@kadam.mountain>

On Wed, Oct 11, 2023 at 10:19:31AM +0300, Dan Carpenter wrote:
>
> smatch warnings:
> crypto/lskcipher.c:639 lskcipher_alloc_instance_simple() warn: passing zero to 'ERR_PTR'

Thanks for the report.  This patch should fix the problem:

---8<---
Set the error value to -EINVAL instead of zero when the underlying
name (within "ecb()") fails basic sanity checks.

Fixes: 8aee5d4ebd11 ("crypto: lskcipher - Add compatibility wrapper around ECB")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202310111323.ZjK7bzjw-lkp@intel.com/

diff --git a/crypto/lskcipher.c b/crypto/lskcipher.c
index 9be3c04bc62a..cb6170ebcaa3 100644
--- a/crypto/lskcipher.c
+++ b/crypto/lskcipher.c
@@ -583,6 +583,7 @@ struct lskcipher_instance *lskcipher_alloc_instance_simple(
 	if (ecb_name[0]) {
 		int len;
 
+		err = -EINVAL;
 		len = strscpy(ecb_name, &cipher_alg->co.base.cra_name[4],
 			      sizeof(ecb_name));
 		if (len < 2)
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
