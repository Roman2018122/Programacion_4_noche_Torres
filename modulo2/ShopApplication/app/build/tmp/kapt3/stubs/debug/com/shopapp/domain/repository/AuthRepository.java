package com.shopapp.domain.repository;

@kotlin.Metadata(mv = {1, 9, 0}, k = 1, xi = 48, d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0010\u0002\n\u0002\b\u0007\bf\u0018\u00002\u00020\u0001J\u0010\u0010\u0002\u001a\u0004\u0018\u00010\u0003H\u00a6@\u00a2\u0006\u0002\u0010\u0004J\u000e\u0010\u0005\u001a\u00020\u0006H\u00a6@\u00a2\u0006\u0002\u0010\u0004J,\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\t0\b2\u0006\u0010\n\u001a\u00020\u000b2\u0006\u0010\f\u001a\u00020\u000bH\u00a6@\u00f8\u0001\u0000\u00f8\u0001\u0001\u00a2\u0006\u0004\b\r\u0010\u000eJ\u001c\u0010\u000f\u001a\b\u0012\u0004\u0012\u00020\u00100\bH\u00a6@\u00f8\u0001\u0000\u00f8\u0001\u0001\u00a2\u0006\u0004\b\u0011\u0010\u0004J<\u0010\u0012\u001a\b\u0012\u0004\u0012\u00020\t0\b2\u0006\u0010\n\u001a\u00020\u000b2\u0006\u0010\u0013\u001a\u00020\u000b2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\u0014\u001a\u00020\u000bH\u00a6@\u00f8\u0001\u0000\u00f8\u0001\u0001\u00a2\u0006\u0004\b\u0015\u0010\u0016\u0082\u0002\u000b\n\u0002\b!\n\u0005\b\u00a1\u001e0\u0001\u00a8\u0006\u0017"}, d2 = {"Lcom/shopapp/domain/repository/AuthRepository;", "", "getStoredUser", "Lcom/shopapp/data/local/TokenDataStore$UserSnapshot;", "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "isLoggedIn", "", "login", "Lkotlin/Result;", "Lcom/shopapp/domain/model/LoggedUser;", "username", "", "password", "login-0E7RQCE", "(Ljava/lang/String;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "logout", "", "logout-IoAF18A", "register", "email", "password2", "register-yxL6bBk", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "app_debug"})
public abstract interface AuthRepository {
    
    @org.jetbrains.annotations.Nullable()
    public abstract java.lang.Object getStoredUser(@org.jetbrains.annotations.NotNull()
    kotlin.coroutines.Continuation<? super com.shopapp.data.local.TokenDataStore.UserSnapshot> $completion);
    
    @org.jetbrains.annotations.Nullable()
    public abstract java.lang.Object isLoggedIn(@org.jetbrains.annotations.NotNull()
    kotlin.coroutines.Continuation<? super java.lang.Boolean> $completion);
}