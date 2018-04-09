import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs/Observable';
import { Login } from '../models/login.model';

@Injectable()
export class RaterServices {
    constructor(private http: HttpClient){}


    public login(login : Login): Observable<any> {
        return this.http.post('http://localhost:8080/login', login);
    }
}