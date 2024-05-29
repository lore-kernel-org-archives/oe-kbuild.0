Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E18818133A;
	Wed, 29 May 2024 15:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716997372; cv=none; b=PJANSJgn+I0p00ITtakqsZwIvRntwfg7DEmqMFqzB+cL5E2AHMaWmDHzQJn0DwmD87qDg13eqfH7Euclgdl1N+PDAGcZzPCld2BWVlqz1YLoiXi4GDYOVzRDLN1XOy7cYDIeSCmabxdtHfGLN5QprRIsaLPkdQVfZp0jGYOeK4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716997372; c=relaxed/simple;
	bh=Uw1a+c/jvh0mrjmbLpbT8XsGRX5cL+x+MxpnCD3WJc0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=jWMU79H+TPCjKBE6WgygX5DkqBJ9EzPOfYQSJTowjQV7xDSvk49RX+Cac5nGSOEUuRra460eFZO3KjSHmErloqUZSy3H9fvi7Eo8MivQcTtTUV7n/SAfqWzAEQsF734Id2u4rGshHvBeG2iR9w98RETWLIEbaCGwFQMz0A2sbNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nAx6bltk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nAx6bltk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9471C113CC;
	Wed, 29 May 2024 15:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716997372;
	bh=Uw1a+c/jvh0mrjmbLpbT8XsGRX5cL+x+MxpnCD3WJc0=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=nAx6bltkZ2yh+OGuUNvSi/xvxcXZWfU8rGKXUltKIFPpbQhEyUzWo5lwfEIgQQeuG
	 9iWFzWD1tJrYOjHtdIlJJFGXoTcpVE6K95Y0wQBmpDShM9i7cLvudOodHivwZ2Nm0J
	 eOhPqfDQglWHeMI2DSjUAWLQn8grTS9jDQai7GRgY8pnrxO/JK20LGLgsLWGl9AuQk
	 E98pl5i17jJEjLS9RFXCQIK8bttvjJUO4wDLTI7nn6d6abxvI4Wo1T9GDijPl+Ik1S
	 cvBj1VbRdzhoUkNY9Gf9JL4pFqT8P3mimYUoiuP42VHolUE8CEzKYdoAmXRf44/a2B
	 V2d7eR+jv3ajw==
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 May 2024 18:42:49 +0300
Message-Id: <D1M8RQ9YRARD.25KABQOVVVG7J@kernel.org>
Subject: Re: [jarkko-tpmdd:tpm2key-v7 8/9]
 crypto/asymmetric_keys/tpm2_key_rsa.c:636 tpm2_key_rsa_preparse() error:
 uninitialized symbol 'ret'.
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Dan Carpenter" <dan.carpenter@linaro.org>, <oe-kbuild@lists.linux.dev>
Cc: <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>, "James Prestwood"
 <prestwoj@gmail.com>
X-Mailer: aerc 0.17.0
References: <cbae0ed0-e0a6-41ba-9671-a9f48e8f07f3@moroto.mountain>
In-Reply-To: <cbae0ed0-e0a6-41ba-9671-a9f48e8f07f3@moroto.mountain>

On Wed May 29, 2024 at 5:36 PM EEST, Dan Carpenter wrote:
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.=
git tpm2key-v7
> head:   892305fec7841bf841a9c19e01c999c5f4b4e831
> commit: 4970b8d723c3af732b21a8bf7c1eebfb03792457 [8/9] keys: asymmetric: =
Add tpm2_key_rsa
> config: alpha-randconfig-r081-20240529 (https://download.01.org/0day-ci/a=
rchive/20240529/202405291528.FxUKVyP2-lkp@intel.com/config)
> compiler: alpha-linux-gcc (GCC) 13.2.0
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202405291528.FxUKVyP2-lkp@intel.com/
>
> smatch warnings:
> crypto/asymmetric_keys/tpm2_key_rsa.c:636 tpm2_key_rsa_preparse() error: =
uninitialized symbol 'ret'.
>
> vim +/ret +636 crypto/asymmetric_keys/tpm2_key_rsa.c
>
> 4970b8d723c3af Jarkko Sakkinen 2024-05-26  629  static int tpm2_key_rsa_p=
reparse(struct key_preparsed_payload *prep)
> 4970b8d723c3af Jarkko Sakkinen 2024-05-26  630  {
> 4970b8d723c3af Jarkko Sakkinen 2024-05-26  631  	struct tpm2_key *key;
> 4970b8d723c3af Jarkko Sakkinen 2024-05-26  632  	int ret;
> 4970b8d723c3af Jarkko Sakkinen 2024-05-26  633 =20
> 4970b8d723c3af Jarkko Sakkinen 2024-05-26  634  	key =3D tpm2_key_decode(=
prep->data, prep->datalen);
> 4970b8d723c3af Jarkko Sakkinen 2024-05-26  635  	if (IS_ERR(key))
> 4970b8d723c3af Jarkko Sakkinen 2024-05-26 @636  		return ret;
>                                                                 ^^^^^^^^^=
^
> Same.  return PTR_ERR(key);
>
> 4970b8d723c3af Jarkko Sakkinen 2024-05-26  637 =20
> 4970b8d723c3af Jarkko Sakkinen 2024-05-26  638  	if (key->oid !=3D OID_TP=
MLoadableKey) {
> 4970b8d723c3af Jarkko Sakkinen 2024-05-26  639  		kfree(key);
> 4970b8d723c3af Jarkko Sakkinen 2024-05-26  640  		return -EBADMSG;
> 4970b8d723c3af Jarkko Sakkinen 2024-05-26  641  	}

Thanks for spotting this!

BR, Jarkko
