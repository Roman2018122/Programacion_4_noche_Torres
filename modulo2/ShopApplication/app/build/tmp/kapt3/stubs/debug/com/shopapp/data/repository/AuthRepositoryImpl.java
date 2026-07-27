package com.shopapp.data.repository;

@javax.inject.Singleton()
@kotlin.Metadata(mv = {1, 9, 0}, k = 1, xi = 48, d1 = {"\u0000H\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0010\u0002\n\u0002\b\u0004\n\u0002\u0010\b\n\u0002\b\u0006\b\u0007\u0018\u00002\u00020\u0001B\u0017\b\u0007\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0002\u0010\u0006J\u0010\u0010\u0007\u001a\u0004\u0018\u00010\bH\u0096@\u00a2\u0006\u0002\u0010\tJ\u000e\u0010\n\u001a\u00020\u000bH\u0096@\u00a2\u0006\u0002\u0010\tJ,\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u000e0\r2\u0006\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u0010H\u0096@\u00f8\u0001\u0000\u00f8\u0001\u0001\u00a2\u0006\u0004\b\u0012\u0010\u0013J\u001c\u0010\u0014\u001a\b\u0012\u0004\u0012\u00020\u00150\rH\u0096@\u00f8\u0001\u0000\u00f8\u0001\u0001\u00a2\u0006\u0004\b\u0016\u0010\tJ\u0018\u0010\u0017\u001a\u00020\u00102\u0006\u0010\u0018\u001a\u00020\u00102\u0006\u0010\u0019\u001a\u00020\u001aH\u0002J<\u0010\u001b\u001a\b\u0012\u0004\u0012\u00020\u000e0\r2\u0006\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u001c\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u001d\u001a\u00020\u0010H\u0096@\u00f8\u0001\u0000\u00f8\u0001\u0001\u00a2\u0006\u0004\b\u001e\u0010\u001fR\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u0082\u0002\u000b\n\u0002\b!\n\u0005\b\u00a1\u001e0\u0001\u00a8\u0006 "}, d2 = {"Lcom/shopapp/data/repository/AuthRepositoryImpl;", "Lcom/shopapp/domain/repository/AuthRepository;", "api", "Lcom/shopapp/data/remote/api/AuthApi;", "tokenDataStore", "Lcom/shopapp/data/local/TokenDataStore;", "(Lcom/shopapp/data/remote/api/AuthApi;Lcom/shopapp/data/local/TokenDataStore;)V", "getStoredUser", "Lcom/shopapp/data/local/TokenDataStore$UserSnapshot;", "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "isLoggedIn", "", "login", "Lkotlin/Result;", "Lcom/shopapp/domain/model/LoggedUser;", "username", "", "password", "login-0E7RQCE", "(Ljava/lang/String;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "logout", "", "logout-IoAF18A", "parseErrorMessage", "body", "code", "", "register", "email", "password2", "register-yxL6bBk", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "app_debug"})
public final class AuthRepositoryImpl implements com.shopapp.domain.repository.AuthRepository {
    @org.jetbrains.annotations.NotNull()
    private final com.shopapp.data.remote.api.AuthApi api = null;
    @org.jetbrains.annotations.NotNull()
    private final com.shopapp.data.local.TokenDataStore tokenDataStore = null;
    
    @javax.inject.Inject()
    public AuthRepositoryImpl(@org.jetbrains.annotations.NotNull()
    com.shopapp.data.remote.api.AuthApi api, @org.jetbrains.annotations.NotNull()
    com.shopapp.data.local.TokenDataStore tokenDataStore) {
        super();
    }
    
    @java.lang.Override()
    @org.jetbrains.annotations.Nullable()
    public java.lang.Object getStoredUser(@org.jetbrains.annotations.NotNull()
    kotlin.coroutines.Continuation<? super com.shopapp.data.local.TokenDataStore.UserSnapshot> $completion) {
        return null;
    }
    
    @java.lang.Override()
    @org.jetbrains.annotations.Nullable()
    public java.lang.Object isLoggedIn(@org.jetbrains.annotations.NotNull()
    kotlin.coroutines.Continuation<? super java.lang.Boolean> $completion) {
        return null;
    }
    
    private final java.lang.String parseErrorMessage(java.lang.String body, int code) {
        return null;
    }
}