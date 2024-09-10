Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC7123774
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Sep 2024 21:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726003372; cv=none; b=JpgVhOH9M3ywPokar2UHSJ1Jzap3Tz6j+FhFcFrrg/yq63LBFbGl+TELZCaAlqCQWI67IWbt2xXZKovPFqD8d/Dwbatt5K4+HLysOawD03MwPkT8D5pZMeWAm4r2qC6M0ubnKi7A7Z/zBgqCMJuMhl7bRHGuAyYwKx3UGHXo1ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726003372; c=relaxed/simple;
	bh=g2IZLba3/WnIUuxyDP7eK54cQ7B9oZtD+WTeIJ/fUNI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f2tpU1D3K3NcrJ5rCQOP6oHengkL/XMxkWwI/RH63ug6WWZERmqIvb2HwcyXkSrN4GVfbjZijPkB0mHdm+t3BmL37hz6Hdc9sssw6Ejk3AWzpLfpiFhtFn1iPmWHvYXbYnWVJjWZFGahQyQFIPyxlvf2VQ9hQcSXSafeuzq20Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=CgyhNF8q; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="CgyhNF8q"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-374c7d14191so136978f8f.0
        for <oe-kbuild@lists.linux.dev>; Tue, 10 Sep 2024 14:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726003368; x=1726608168; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rmpqhs1xd8bfsJ3sKQnLTZJeE5iZf3lqCOadMn3tHHM=;
        b=CgyhNF8qqhMb+pKblTXgOor6pzGWIV2F6txpLEbSFk7XWr+8D35mvGM0ZIJkLT0vgs
         ZfIoiaS7PHUJyAm6vagZnpES59EDnFWzntfG8sLE78wkXAkFjcT9hKKVZ6zlbLdPh8yc
         MybCSfbeYbAOfGcdD/lsF/wbry2lN9E7VW5s05VPPVHKVZ8ZA7bF60rU73D51Xk++7s4
         be5qanTPdHDDGTRyzlQIADtaMH+W+dTY6r/neMeW8smN5fAI2MiBa1V7xPkSsrW8cRMA
         EFcwDk78G/sSvTlpTeeoCti1IiiUheeKB6g6KslUznRqvXRlF6Poo5VdR0Q4wN/zjF7l
         nHjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726003368; x=1726608168;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rmpqhs1xd8bfsJ3sKQnLTZJeE5iZf3lqCOadMn3tHHM=;
        b=DduWvtv1k3otI4LtVwkASmBO+lQirydks7TswVQf+DJ2Q8zaWPQqK/HRcxZio2vbwp
         twf9Q9smTgED3TR609TL9vW5Jqr6PiESDlW4v4SGAZ4J732TyDv/i0q1eHJL9xlFAcb8
         YQn4WcxQoYFsP6FyiGwe6z0dDrndK+Ys8N7rM35cwfSyTOwnO7APNxMxl0AWqli/y0h4
         vJt0a8bq2pdk9Oe2ybKv54eX1yYd06tF1BNfgmrVEXWj13B95zAJ5aG3vzkcc36bF3L6
         AsNEV/Q+Uc6E6VOMhWeAPAM9PnLyqKNc+t8abH1m6V8lsXsQo1kUROF1BZ2dtZz3ykqr
         HnQg==
X-Forwarded-Encrypted: i=1; AJvYcCWp0Oa18YVEhNXY87n3Wn5kHASBm+nWXJjjRjw+XY2adipYKS14btxZVHlS6wZ4r3l72Z9gY3zDQfU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwlA7lV3X/zC/VVKrwVwTRcO12qmAfptVsGm17yJJUiTE6GXzKm
	rGIQaOpgl2tDsuIhxwzlPpaO+q3pOX2otn0rls8xAl3nfrE0cOanLJcn9QRX3ts=
X-Google-Smtp-Source: AGHT+IG/EKbvdEZA2oSGr4EkL1Cx4pXjhdd/S2ypRMSM1ZbRXY6aQkk5kuEJiX9yXagjcO8v1pTdMg==
X-Received: by 2002:a5d:5f46:0:b0:36b:c65c:661e with SMTP id ffacd0b85a97d-378a8a1d30cmr3607509f8f.13.1726003367534;
        Tue, 10 Sep 2024 14:22:47 -0700 (PDT)
Received: from ?IPV6:2403:580d:fda1::299? (2403-580d-fda1--299.ip6.aussiebb.net. [2403:580d:fda1::299])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dadb42e6fasm9087783a91.0.2024.09.10.14.22.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Sep 2024 14:22:47 -0700 (PDT)
Message-ID: <4168874d-41ae-41e2-aa9e-7cf4281278d3@suse.com>
Date: Wed, 11 Sep 2024 06:52:42 +0930
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 9813/10862] fs/btrfs/subpage.c:437
 btrfs_folio_end_writer_lock_bitmap() warn: variable dereferenced before check
 'fs_info' (see line 431)
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 David Sterba <dsterba@suse.com>
References: <3023236c-6e88-407b-9640-5b956d4c969c@stanley.mountain>
Content-Language: en-US
From: Qu Wenruo <wqu@suse.com>
Autocrypt: addr=wqu@suse.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNGFF1IFdlbnJ1byA8d3F1QHN1c2UuY29tPsLAlAQTAQgAPgIbAwULCQgHAgYVCAkKCwIE
 FgIDAQIeAQIXgBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJjTSJVBQkNOgemAAoJEMI9kfOh
 Jf6oapEH/3r/xcalNXMvyRODoprkDraOPbCnULLPNwwp4wLP0/nKXvAlhvRbDpyx1+Ht/3gW
 p+Klw+S9zBQemxu+6v5nX8zny8l7Q6nAM5InkLaD7U5OLRgJ0O1MNr/UTODIEVx3uzD2X6MR
 ECMigQxu9c3XKSELXVjTJYgRrEo8o2qb7xoInk4mlleji2rRrqBh1rS0pEexImWphJi+Xgp3
 dxRGHsNGEbJ5+9yK9Nc5r67EYG4bwm+06yVT8aQS58ZI22C/UeJpPwcsYrdABcisd7dddj4Q
 RhWiO4Iy5MTGUD7PdfIkQ40iRcQzVEL1BeidP8v8C4LVGmk4vD1wF6xTjQRKfXHOwE0EWdWB
 rwEIAKpT62HgSzL9zwGe+WIUCMB+nOEjXAfvoUPUwk+YCEDcOdfkkM5FyBoJs8TCEuPXGXBO
 Cl5P5B8OYYnkHkGWutAVlUTV8KESOIm/KJIA7jJA+Ss9VhMjtePfgWexw+P8itFRSRrrwyUf
 E+0WcAevblUi45LjWWZgpg3A80tHP0iToOZ5MbdYk7YFBE29cDSleskfV80ZKxFv6koQocq0
 vXzTfHvXNDELAuH7Ms/WJcdUzmPyBf3Oq6mKBBH8J6XZc9LjjNZwNbyvsHSrV5bgmu/THX2n
 g/3be+iqf6OggCiy3I1NSMJ5KtR0q2H2Nx2Vqb1fYPOID8McMV9Ll6rh8S8AEQEAAcLAfAQY
 AQgAJgIbDBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJjTSJuBQkNOge/AAoJEMI9kfOhJf6o
 rq8H/3LJmWxL6KO2y/BgOMYDZaFWE3TtdrlIEG8YIDJzIYbNIyQ4lw61RR+0P4APKstsu5VJ
 9E3WR7vfxSiOmHCRIWPi32xwbkD5TwaA5m2uVg6xjb5wbdHm+OhdSBcw/fsg19aHQpsmh1/Q
 bjzGi56yfTxxt9R2WmFIxe6MIDzLlNw3JG42/ark2LOXywqFRnOHgFqxygoMKEG7OcGy5wJM
 AavA+Abj+6XoedYTwOKkwq+RX2hvXElLZbhYlE+npB1WsFYn1wJ22lHoZsuJCLba5lehI+//
 ShSsZT5Tlfgi92e9P7y+I/OzMvnBezAll+p/Ly2YczznKM5tV0gboCWeusM=
In-Reply-To: <3023236c-6e88-407b-9640-5b956d4c969c@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2024/9/10 22:22, Dan Carpenter 写道:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   6708132e80a2ced620bde9b9c36e426183544a23
> commit: 966416b380926c94751476747ea68571004eac24 [9813/10862] btrfs: only unlock the to-be-submitted ranges inside a folio
> config: i386-randconfig-141-20240910 (https://download.01.org/0day-ci/archive/20240910/202409101924.XTvd0yQv-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202409101924.XTvd0yQv-lkp@intel.com/
> 
> smatch warnings:
> fs/btrfs/subpage.c:437 btrfs_folio_end_writer_lock_bitmap() warn: variable dereferenced before check 'fs_info' (see line 431)
> 
> vim +/fs_info +437 fs/btrfs/subpage.c

Thanks for the report.

It looks like the extra checks are duplicated.

This function is only called inside extent_writepage(), which will never 
be triggered from selftest, thus fs_info should always exist.

I can remove the fs_info check from our btrfs/for-next branch.

Thanks,
Qu
> 
> 966416b380926c Qu Wenruo 2024-09-02  427  void btrfs_folio_end_writer_lock_bitmap(const struct btrfs_fs_info *fs_info,
> 966416b380926c Qu Wenruo 2024-09-02  428  					struct folio *folio, unsigned long bitmap)
> 966416b380926c Qu Wenruo 2024-09-02  429  {
> 966416b380926c Qu Wenruo 2024-09-02  430  	struct btrfs_subpage *subpage = folio_get_private(folio);
> 966416b380926c Qu Wenruo 2024-09-02 @431  	const int start_bit = fs_info->sectors_per_page * btrfs_bitmap_nr_locked;
>                                                                        ^^^^^^^^^^^^^^^^^^^^^^^^^
> Dereference
> 
> 966416b380926c Qu Wenruo 2024-09-02  432  	unsigned long flags;
> 966416b380926c Qu Wenruo 2024-09-02  433  	bool last = false;
> 966416b380926c Qu Wenruo 2024-09-02  434  	int cleared = 0;
> 966416b380926c Qu Wenruo 2024-09-02  435  	int bit;
> 966416b380926c Qu Wenruo 2024-09-02  436
> 966416b380926c Qu Wenruo 2024-09-02 @437  	if (unlikely(!fs_info) || !btrfs_is_subpage(fs_info, folio->mapping)) {
>                                                               ^^^^^^^^^
> Too late
> 
> 966416b380926c Qu Wenruo 2024-09-02  438  		folio_unlock(folio);
> 966416b380926c Qu Wenruo 2024-09-02  439  		return;
> 966416b380926c Qu Wenruo 2024-09-02  440  	}
> 966416b380926c Qu Wenruo 2024-09-02  441
> 966416b380926c Qu Wenruo 2024-09-02  442  	if (atomic_read(&subpage->writers) == 0) {
> 966416b380926c Qu Wenruo 2024-09-02  443  		/* No writers, locked by plain lock_page(). */
> 966416b380926c Qu Wenruo 2024-09-02  444  		folio_unlock(folio);
> 966416b380926c Qu Wenruo 2024-09-02  445  		return;
> 966416b380926c Qu Wenruo 2024-09-02  446  	}
> 966416b380926c Qu Wenruo 2024-09-02  447
> 966416b380926c Qu Wenruo 2024-09-02  448  	spin_lock_irqsave(&subpage->lock, flags);
> 966416b380926c Qu Wenruo 2024-09-02  449  	for_each_set_bit(bit, &bitmap, fs_info->sectors_per_page) {
> 966416b380926c Qu Wenruo 2024-09-02  450  		if (test_and_clear_bit(bit + start_bit, subpage->bitmaps))
> 966416b380926c Qu Wenruo 2024-09-02  451  			cleared++;
> 966416b380926c Qu Wenruo 2024-09-02  452  	}
> 966416b380926c Qu Wenruo 2024-09-02  453  	ASSERT(atomic_read(&subpage->writers) >= cleared);
> 966416b380926c Qu Wenruo 2024-09-02  454  	last = atomic_sub_and_test(cleared, &subpage->writers);
> 966416b380926c Qu Wenruo 2024-09-02  455  	spin_unlock_irqrestore(&subpage->lock, flags);
> 966416b380926c Qu Wenruo 2024-09-02  456  	if (last)
> 966416b380926c Qu Wenruo 2024-09-02  457  		folio_unlock(folio);
> 966416b380926c Qu Wenruo 2024-09-02  458  }
> 
