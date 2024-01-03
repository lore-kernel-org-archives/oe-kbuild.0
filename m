Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5841D52E
	for <oe-kbuild@lists.linux.dev>; Wed,  3 Jan 2024 20:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="dIpVpd0s"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-5ce2aada130so2188276a12.1
        for <oe-kbuild@lists.linux.dev>; Wed, 03 Jan 2024 12:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704313638; x=1704918438; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xcsOQ9nD5GPnMMvdZNgPzZalWOKW9Ch4bNlsftdutyM=;
        b=dIpVpd0snuwWWVghwS/GMBOMa7eGqHlLweLJ+m51hPGt5veMDDJSjtEd6cLawO5C0C
         zmGcBTV5x7lhZpZfH04jt6G/ljRDOEuTyMLrClUK8lMYeQ6hWArvWYkNoic3Skf1BW/P
         I3Gaa4oFclA8dGKv/JbMKtGf+tRn4f004wuQpydjX+Uj0+wNc32ici9IFvErrSWIulrp
         p6qhqXHie1s22H3JnEbzH/LsAXzvYF7wyw3UlZDN6NUvLgD86xDhOCo0PPjr1vUVb6oR
         oGxN0MA+EuDKg1upK4R0kDF5TmJ+1XwAyUx7t1amcx1WJaPsQlrYdUSTeu/zuocROdS1
         tuGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704313638; x=1704918438;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xcsOQ9nD5GPnMMvdZNgPzZalWOKW9Ch4bNlsftdutyM=;
        b=qkRadUUiN+ghsnSbUoqwPcUVWI/jrzktQ5qrCIObOH9+JMMgOfw+GJMMf/FQOQWzcM
         1GE0COyqww/jStz2eNMx2vzn0AYI3f3rhbJLcvfLOMWyPapkRsjK1ezvYVXzQv/3wfFd
         vyxQKKGFh3+3N8t9P5bA7Arh26CB1iPCpYDyT5aNnBuXiGWizMcyxitpIi000tv+Gr3g
         NCgLNm5poT1AcEl+BiDO1zcUr9IA2bQV5rVQoR2jrEBAaHAQh0mdRXvFCojrC0etUhBT
         jtAYt559pxYrQYN4+lRUQ/plV1UqXlOoaANLYK3o/y0tfjCuCI3HwxLQqR2X4iKtX80w
         NV8w==
X-Gm-Message-State: AOJu0YzTmMaJDu+0Op+Y8afNQ5pbBcwHd9xq+yugBE4zCFwj9i2MsuYN
	ctFWN0ZEqwbyYDQhUk3TPrht8DfH8ZBcdg==
X-Google-Smtp-Source: AGHT+IGfGjwL1gOAZN1cJcV3cHT0ah1Btx46k+DeH+QlmZ3yh13pe7S1KrdoMLLsu6lIidEfExM5yg==
X-Received: by 2002:a05:6a20:938b:b0:197:58b5:3251 with SMTP id x11-20020a056a20938b00b0019758b53251mr2377252pzh.113.1704313638634;
        Wed, 03 Jan 2024 12:27:18 -0800 (PST)
Received: from ghost (070-095-050-247.res.spectrum.com. [70.95.50.247])
        by smtp.gmail.com with ESMTPSA id u16-20020a056a00099000b006d9c7f2840bsm16045592pfg.57.2024.01.03.12.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 12:27:18 -0800 (PST)
Date: Wed, 3 Jan 2024 12:27:15 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: arch/riscv/kernel/module.c:639 process_accumulated_relocations()
 error: uninitialized symbol 'curr_type'.
Message-ID: <ZZXDI78QsaXzbfR+@ghost>
References: <d0897fb3-1af8-430b-aa8b-9aa829bad1d7@suswa.mountain>
 <ZXoFhu2TPXgrsInY@ghost>
 <a46f0c36-8fd2-4a85-880c-eb462d4a837b@suswa.mountain>
 <ZYzIbVfge6I8Ptw0@ghost>
 <c11513b4-6e60-44b5-ba12-83fbb9b7e2c3@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c11513b4-6e60-44b5-ba12-83fbb9b7e2c3@suswa.mountain>

On Tue, Jan 02, 2024 at 03:37:34PM +0300, Dan Carpenter wrote:
> On Wed, Dec 27, 2023 at 04:59:25PM -0800, Charlie Jenkins wrote:
> > On Thu, Dec 14, 2023 at 11:00:46AM +0300, Dan Carpenter wrote:
> > > On Wed, Dec 13, 2023 at 11:27:02AM -0800, Charlie Jenkins wrote:
> > > > > 8fd6c5142395a1 Charlie Jenkins 2023-11-01  638  			}
> > > > > 8fd6c5142395a1 Charlie Jenkins 2023-11-01 @639  			reloc_handlers[curr_type].accumulate_handler(
> > > > >                                                                                        ^^^^^^^^^
> > > > > Can the list be empty?  Uninitialized in that case.
> > > > 
> > > > That's a tricky one, the list cannot be empty. Each bucket in the
> > > > bucket_iter is guarunteed to have at least one rel_entry. I can probably
> > > > resolve this by extracting this for loop into a do-while loop.
> > > 
> > > You can just ignore false positives.  It's not really a fix to change it
> > > to a do-while loop.  I reviewed the do while code before reading this
> > > email and I still wondered about empty lists, but just to hear that it's
> > > not going to be empty is enough.  Just the email was sufficient.
> > > 
> > > regards,
> > > dan carpenter
> > > 
> > 
> > The fix isn't the do-while loop but rather the use after free, the
> > incorrect sizeof, and incorrect error handling when
> > initialize_relocation_hashtable fails. I decided to include the do-while
> > code because I was already touching the surrounding code. Can you review
> > [1]? If you would prefer that the do-while is reverted, I can do that,
> > but it is important that the rest of the fixes are merged before 6.7 is
> > released.
> > 
> > [1] https://lore.kernel.org/all/20231213-module_loading_fix-v1-1-da9b7c92ade5@rivosinc.com/
> 
> 
> Most subsystems wouldn't merge a patch like this which does so many
> things at the same time...

That is a good point, I split it across 4 different patches.

https://lore.kernel.org/linux-riscv/20240103-module_loading_fix-v2-0-292b160552c9@rivosinc.com/

> 
> regards,
> dan carpenter
> 
